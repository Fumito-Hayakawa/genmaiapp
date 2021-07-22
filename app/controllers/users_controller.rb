class UsersController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  before_action :logged_in_user
  
  def index
    @users = User.all
  end
end