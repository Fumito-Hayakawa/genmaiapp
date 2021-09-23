class RelationshipsController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    redirect_to user_profiles_path(@user)
    # respond_to do |format|
      # format.html { redirect_to user_profiles_path(@user) }
      # format.js
    # end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    redirect_to user_profiles_path(@user)
    # respond_to do |format|
      # format.html { redirect_to user_profiles_path(@user) }
      # format.js
    # end
  end
end
