class UsersController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  before_action :logged_in_user
  
  def index
    @users = User.all.page(params[:page]).per(20)
  end
end