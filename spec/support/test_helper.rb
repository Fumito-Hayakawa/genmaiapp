include ApplicationHelper # full_titleメソッドの読み込み

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