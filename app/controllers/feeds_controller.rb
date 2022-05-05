class FeedsController < ApplicationController
  # ヘルパーメソッド読み込みのため
  include ApplicationHelper
  before_action :logged_in_user
  # feedsコントローラーのみ、全レシピから検索ではなくフィードのみから検索するため。
  skip_before_action :set_search
  before_action :set_search_feed

  def feed
    @user = current_user
    @feed_items ||= current_user.feed.page(params[:page]).per(10)
  end

  private

  def set_search_feed
    @search_word = params[:q][:name_or_ingredients_name_cont] if params[:q]
    @q = current_user.feed.page(params[:page]).per(10).ransack(params[:q])
    @feed_items = @q.result(distinct: true).page(params[:page]).per(10)
  end
end
