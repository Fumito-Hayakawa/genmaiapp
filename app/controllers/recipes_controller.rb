class RecipesController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  before_action :logged_in_user

  def new
    @recipe = Recipe.new
  end
end
