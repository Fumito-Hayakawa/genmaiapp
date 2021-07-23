class UsersController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  before_action :logged_in_user
  
  def index
    @users = User.all.page(params[:page]).per(20)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "アカウントを削除しました"
    redirect_to root_url
  end
end