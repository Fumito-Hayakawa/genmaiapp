class Users::RecipesController < ApplicationController
  before_action :logged_in_user

  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.page(params[:page]).per(8)
  end

  def new
    @recipe = Recipe.new
  end
end
