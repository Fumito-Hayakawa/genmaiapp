class CommentsController < ApplicationController
  include ApplicationHelper
  before_action :logged_in_user

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @user = @recipe.user
    @comment = @recipe.comments.build(user_id: current_user.id, content: params[:comment][:content])
    if !@recipe.nil? && @comment.save
      flash[:success] = "コメントを投稿しました"
    else
      flash[:danger] = "空のコメントは投稿できません。"
    end
    redirect_to request.referrer || root_url
  end

  def destroy
    @comment = Comment.find(params[:id])
    @recipe = @comment.recipe
    if current_user.id == @comment.user_id
      @comment.destroy
      flash[:success] = "コメントを削除しました"
    end
    redirect_to recipe_url(@recipe)
  end
end
