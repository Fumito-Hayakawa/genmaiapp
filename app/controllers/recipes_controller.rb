class RecipesController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  before_action :logged_in_user

  def show
    @recipe = Recipe.find(params[:id])
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
      redirect_to root_url
    else
      render 'recipes/new'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :portion, :description, :portion, :tips, :user_id)
  end
end
