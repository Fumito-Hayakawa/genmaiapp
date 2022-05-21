class Users::ProfilesController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update]

  def show
    # はじめ@user = current_userとしていたが、テスト時にプロフィールへのリンクにあるuser_idがnilに。この通常通りの書き方が必要だった。
    @user = User.find(params[:user_id])
  end

  def edit
    # ルーティングをネストしているため、params[:id]だとエラーになる。
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    if @user.update(params.require(:user).permit(:name, :email, :introduction, :user_image))
      flash[:success] = "プロフィールの情報を更新しました"
      redirect_to root_url
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    # 管理者ユーザーの場合
    if current_user.admin?
      @user.destroy
      flash[:success] = "ユーザーの削除に成功しました"
      redirect_to users_url
    # 管理者ユーザーではないが、自分のアカウントの場合
    elsif current_user?(@user)
      @user.destroy
      flash[:success] = "自分のアカウントを削除しました"
      redirect_to root_url
    else
      flash[:danger] = "自分以外のアカウントは削除できません"
      redirect_to root_url
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
