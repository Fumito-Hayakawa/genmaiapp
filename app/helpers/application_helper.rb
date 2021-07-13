module ApplicationHelper
  def full_title(page_title = '') # full_titleメソッドを定義
    base_title = '玄米生活レシピ投稿サイト'
    if page_title.blank?
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end
end
