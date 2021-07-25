require 'rails_helper'

RSpec.describe "アカウントページ", type: :request do
  let!(:user) { create(:user) }

  it "レスポンスが正常に表示されること" do
    login_for_request(user)
    get user_accounts_path(user)
    expect(response).to be_successful
    expect(response).to have_http_status "200"
  end
end
