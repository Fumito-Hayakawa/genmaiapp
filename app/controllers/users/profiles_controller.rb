class Users::ProfilesController < ApplicationController
  def show
    @user = current_user
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
