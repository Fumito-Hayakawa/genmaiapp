class RecipesController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
  end

  def new
    @recipe = Recipe.new
    @user = current_user
  end

  def create
    @user = current_user
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "レシピの登録が完了しました！"
      redirect_to recipe_path(@recipe)
    else
      render 'recipes/new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @user = current_user
  end

  def update
    # バリデーションエラーの場合に以下入っていないとrender後user_idがnilになるため挿入。
    @user = current_user
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "レシピ情報が更新されました！"
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if current_user.admin? || current_user?(@recipe.user)
      @recipe.destroy
      flash[:success] = "レシピが削除されました"
      redirect_to request.referrer == user_url(@recipe.user) ? user_url(@recipe.user) : root_url
    else
      flash[:danger] = "他人のレシピは削除できません"
      redirect_to root_url
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :portion, :tips, :episode, :user_id, :recipe_image)
  end

  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    redirect_to root_url if @recipe.nil?
  end
end
