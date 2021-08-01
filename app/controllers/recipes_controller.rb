class RecipesController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  before_action :logged_in_user, only: [:new, :create]

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
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "レシピ情報が更新されました！"
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :portion, :tips, :episode, :user_id)
  end
end
