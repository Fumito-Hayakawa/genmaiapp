require "rails_helper"
RSpec.describe "ユーザー登録", type: :request do
  before do
    get new_user_registration_path
  end

  it "正常なレスポンスを返すこと" do
    expect(response).to be_successful
    expect(response).to have_http_status "200"
  end

  it "有効なユーザーで登録" do
    expect {
      post user_registration_path, params: { user: { name: "Example User",
                                                     email: "user@example.com",
                                                     password: "password",
                                                     password_confirmation: "password" } }
    }.to change(User, :count).by(1)
    redirect_to @user
    follow_redirect!
    expect(response).to render_template('home/top')
  end

  it "無効なユーザーで登録（名前なし）" do
    expect {
      post users_path, params: { user: { name: "",
                                         email: "user@example.com",
                                         password: "password",
                                         password_confirmation: "password" } }
    }.not_to change(User, :count)
  end

  it "無効なユーザーで登録（パスワード誤り）" do
    expect {
      post users_path, params: { user: { name: "example",
                                         email: "user@example.com",
                                         password: "password",
                                         password_confirmation: "pass" } }
    }.not_to change(User, :count)
  end

  it "無効なユーザーで登録（メールアドレスなし）" do
    expect {
      post users_path, params: { user: { name: "example",
                                         email: "",
                                         password: "password",
                                         password_confirmation: "password" } }
    }.not_to change(User, :count)
  end
end
