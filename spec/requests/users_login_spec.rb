require 'rails_helper'

RSpec.describe "Userページ", type: :request do  
  describe "ログインページ" do
    it "正常なレスポンスを返すこと" do
      get new_user_session_path
      expect(response).to be_successful
      expect(response).to have_http_status "200"
    end
  end
end