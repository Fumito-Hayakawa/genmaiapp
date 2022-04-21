require "rails_helper"

RSpec.describe "料理の削除", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:recipe) { create(:recipe, user: user) }

  context "ログインしていてかつ自分のレシピを削除する場合" do
    it "処理が成功し、トップページにリダイレクトすること" do
      login_for_request(user)
      expect {
        delete recipe_path(recipe)
      }.to change(Recipe, :count).by(-1)
      redirect_to user_path(user)
      follow_redirect!
      expect(response).to render_template('home/top')
    end
  end

  context "ログインしていてかつ他人のレシピを削除する場合" do
    it "処理が失敗し、トップページへリダイレクトすること" do
      login_for_request(other_user)
      expect {
        delete recipe_path(recipe)
      }.not_to change(Recipe, :count)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
    end
  end

  context "ログインしていない場合" do
    it "ログインページへリダイレクトすること" do
      expect {
        delete recipe_path(recipe)
      }.not_to change(Recipe, :count)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to new_user_session_path
    end
  end
end
