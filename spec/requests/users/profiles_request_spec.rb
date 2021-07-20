require 'rails_helper'

RSpec.describe "プロフィールページ", type: :request do
  let!(:user) { create(:user) }

  it "レスポンスが正常に表示されること" do
    get new_user_session_path
    login_for_request(user)
    get user_profiles_path(current_user.id)
    expect(response).to be_successful
    expect(response).to have_http_status "200"
  end
end
