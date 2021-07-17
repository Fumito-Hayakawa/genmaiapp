class Users::ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :introduction, :image_name))
      flash[:notice] = "プロフィールの情報を更新しました"
      redirect_to root_url
    else
    render "edit"
    end
  end
end
