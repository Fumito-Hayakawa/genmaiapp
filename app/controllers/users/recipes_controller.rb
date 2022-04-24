class Users::RecipesController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  before_action :logged_in_user

  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.page(params[:page]).per(8)
  end
end
