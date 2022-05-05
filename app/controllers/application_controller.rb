class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  private

  def configure_permitted_parameters
    # deviseのUserモデルにパラメーターを許可。emailとpasswordはデフォルトで許可のため不要。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_search
    if logged_in?
      @search_word = params[:q][:name_or_ingredients_name_cont] if params[:q]
      @q = Recipe.all.page(params[:page]).per(10).ransack(params[:q])
      @recipes = @q.result(distinct: true)
    end
  end
end
