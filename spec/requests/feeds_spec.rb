require 'rails_helper'

RSpec.describe "feedページテスト", type: :request do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe) }

  describe "feedページ" do
    it "正常なレスポンスを返すこと" do
      login_for_request(user)
      get feeds_path(user)
      expect(response).to be_successful
      expect(response).to have_http_status "200"
    end
  end
end
