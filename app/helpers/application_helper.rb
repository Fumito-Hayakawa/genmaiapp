module ApplicationHelper
  def full_title(page_title = '') # full_titleメソッドを定義
    base_title = '玄米生活レシピ投稿サイト'
    if page_title.blank?
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end

  # ログイン済ユーザーかどうか確認し、ログインしていない場合はフラッシュ
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインが必要です"
      redirect_to new_user_session_path
    end
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    # rubocopで以下エラーのため、実際に使用することが確定次第修正
    # current_user = nil
  end
end
