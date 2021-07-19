class Users::AccountsController < ApplicationController
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
end
