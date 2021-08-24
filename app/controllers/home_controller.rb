class HomeController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  def top
    if logged_in?
      @feed_items = current_user.feed.page(params[:page]).per(5)
    end
  end
end
