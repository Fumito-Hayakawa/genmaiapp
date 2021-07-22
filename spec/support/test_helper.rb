include ApplicationHelper # full_titleメソッドの読み込み

# Request spec用のログインヘルパー
def login_for_request(user)
  post user_session_path, params: { user: { name: user.name,
                                        email: user.email,
                                        password: user.password } }
end

def current_user
  if session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end
end

# System　spec用のログインヘルパー
def login_for_system(user)
  visit new_user_session_path
  fill_in "email_form",    with: user.email
  fill_in "password_form", with: user.password
  click_button "ログイン"
end