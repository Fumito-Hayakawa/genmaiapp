class FavoritesController < ApplicationController
  include ApplicationHelper
  before_action :logged_in_user

  def index
    @favorites = current_user.favorites
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @user = @recipe.user
    current_user.favorite(@recipe)
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    current_user.favorites.find_by(recipe_id: @recipe.id).destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end
