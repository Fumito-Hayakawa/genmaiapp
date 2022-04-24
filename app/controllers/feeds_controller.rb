class FeedsController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  before_action :logged_in_user

  def feed
    @user = current_user
    if logged_in?
      @feed_items = current_user.feed.page(params[:page]).per(5)
    end
  end
end
