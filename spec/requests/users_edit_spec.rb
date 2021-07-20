require "rails_helper"

RSpec.describe "プロフィール編集", type: :request do
  let!(:user) { create(:user) }

  before do
    login_for_request(user)
    get edit_user_profiles_path(user)
  end

  it "有効なプロフィール編集" do
    expect(response).to render_template('users/profiles/edit')
    patch user_profiles_path(user), params: { user: { name: "Example User",
                                             email: "user@example.com",
                                             introduction: "初めまして",} }
    redirect_to root_url
    follow_redirect!
    expect(response).to render_template('home/top')
  end

  it "無効なプロフィール編集" do
    expect(response).to render_template('users/profiles/edit')
    patch user_profiles_path(user), params: { user: { name: "",
                                             email: "user@invalid" } }
    expect(response).to render_template('users/profiles/edit')
  end
end