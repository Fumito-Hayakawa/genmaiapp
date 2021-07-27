class Users::RecipesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.page(params[:page]).per(10)
  end
end
