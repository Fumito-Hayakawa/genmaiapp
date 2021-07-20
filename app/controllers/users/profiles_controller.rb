class Users::ProfilesController < ApplicationController
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
    if @user.update(params.require(:user).permit(:name, :email, :introduction, :image_name))
      flash[:notice] = "プロフィールの情報を更新しました"
      redirect_to root_url
    else
      render "edit"
    end
  end
end
