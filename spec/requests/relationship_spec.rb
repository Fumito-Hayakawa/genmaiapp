require 'rails_helper'

RSpec.describe "ユーザーフォロー機能", type: :request do
  let(:user) { create(:user) }

  context "ログインしていない場合" do
    it "followingページへ飛ぶとログインページへリダイレクトすること" do
      get following_user_path(user)
      expect(response).to redirect_to user_session_path
    end

    it "followerページへ飛ぶとログインページへリダイレクトすること" do
      get followers_user_path(user)
      expect(response).to redirect_to user_session_path
    end

    it "createアクションが実行できず、ログインページへリダイレクトすること" do
      expect {
        post relationships_path
      }.not_to change(Relationship, :count)
      expect(response).to redirect_to user_session_path
    end

    it "destroyアクションが実行できず、ログインページへリダイレクトすること" do
      expect {
        delete relationship_path(user)
      }.not_to change(Relationship, :count)
      expect(response).to redirect_to user_session_path
    end
  end
end