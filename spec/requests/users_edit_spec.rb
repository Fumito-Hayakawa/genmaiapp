require "rails_helper"

RSpec.describe "プロフィール編集", type: :request do
  let!(:user) { create(:user) }

  before do
    login_for_request(user)
    get user_profiles_path(user.id)
  end

  xit "有効なプロフィール編集" do
    expect(response).to render_template('users/edit')
    patch user_path(user), params: { user: { name: "Example User",
                                             email: "user@example.com",
                                             introduction: "初めまして",
                                             sex: "男性" } }
    redirect_to user
    follow_redirect!
    expect(response).to render_template('users/show')
  end

  xit "無効なプロフィール編集" do
    expect(response).to render_template('users/edit')
    patch user_path(user), params: { user: { name: "",
                                             email: "xxx@invalid" } }
    expect(response).to render_template('users/edit')
  end
end