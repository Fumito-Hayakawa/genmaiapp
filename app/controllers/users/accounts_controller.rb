class Users::AccountsController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  before_action :logged_in_user
  before_action :correct_user,  only: [:show, :edit, :update]

  def show
    @user = current_user
  end

  def edit
    # ルーティングをネストしているため、params[:id]だとエラーになる。
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    if @user.update(params.require(:user).permit(:password, :password_confirmation))
      flash[:notice] = "アカウントの情報を更新しました"
      #PW変更後のログアウト防止
      bypass_sign_in(@user)
      redirect_to root_url
    else
      render "edit"
    end
  end

  private

  def correct_user
    @user = User.find(params[:user_id])
    if !current_user?(@user)
      flash[:danger] = "このページへはアクセスできません"
      redirect_to(root_url)
    end
  end
end
