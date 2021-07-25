require "rails_helper"

RSpec.describe "プロフィール・アカウント編集", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  context "認可されたユーザーである本人の場合" do
    it "有効なプロフィール編集" do
      login_for_request(user)
      get edit_user_profiles_path(user)
      expect(response).to render_template('users/profiles/edit')
      patch user_profiles_path(user), params: { user: { name: "Example User",
                                               email: "user@example.com",
                                               introduction: "初めまして",} }
      redirect_to root_url
      follow_redirect!
      expect(response).to render_template('home/top')
    end

    it "有効なパスワード編集" do
      login_for_request(user)
      get edit_user_accounts_path(user)
      expect(response).to render_template('users/accounts/edit')
      patch user_accounts_path(user), params: { user: { password: "password",
                                               password_confirmation: "password"} }
      redirect_to root_url
      follow_redirect!
      expect(response).to render_template('home/top')
    end
  end

  context "ログインしていないがユーザー本人の場合" do
    it "プロフィールを編集または更新するとログイン画面へリダイレクトする" do
      # edit
      get edit_user_profiles_path(user)
      # ページを転送する番号
      expect(response).to have_http_status "302"
      expect(response).to redirect_to new_user_session_path
      # update
      patch user_profiles_path(user), params: { user: { name: "",
                                               email: "user@invalid" } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to new_user_session_path
    end

    it "アカウントを編集または更新するとログイン画面へリダイレクトする" do
      # edit
      get edit_user_accounts_path(user)
      # ページを転送する番号
      expect(response).to have_http_status "302"
      expect(response).to redirect_to new_user_session_path
      # update
      patch user_accounts_path(user), params: { user: { password: "password",
                                               password_confirmation: "password" } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to new_user_session_path
    end
  end

  context "別のアカウントのユーザーである場合" do
    it "プロフィールを編集・更新するとホーム画面にリダイレクトする" do
      # edit
      login_for_request(other_user)
      get edit_user_profiles_path(user)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
      # update
      patch user_profiles_path(user), params: { user: { name: user.name,
                                               email: user.email } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
    end

    it "アカウントを編集・更新するとホーム画面にリダイレクトする" do
      # edit
      login_for_request(other_user)
      get edit_user_accounts_path(user)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
      # update
      patch user_accounts_path(user), params: { user: { password: "password",
                                               password_confirmation: "password" } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
    end
  end
end