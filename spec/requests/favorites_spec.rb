require 'rails_helper'

RSpec.describe "お気に入り登録機能", type: :request do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe) }

  context "お気に入り登録処理" do
    context "ログインしていない場合" do
      it "お気に入り登録は実行できず、ログインページへリダイレクトすること" do
        expect {
          post "/favorites/#{recipe.id}/create"
        }.not_to change(Favorite, :count)
        expect(response).to redirect_to new_user_session_path
      end

      it "お気に入り解除は実行できず、ログインページへリダイレクトすること" do
        expect {
          delete "/favorites/#{recipe.id}/destroy"
        }.not_to change(Favorite, :count)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end