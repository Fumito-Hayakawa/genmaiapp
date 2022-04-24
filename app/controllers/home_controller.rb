class HomeController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  def top
    @recipes = Recipe.all.page(params[:page]).per(10)
  end
end
