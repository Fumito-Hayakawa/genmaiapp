require 'rails_helper'

RSpec.describe "レシピ登録", type: :request do
  let!(:user) { create(:user) }
  let!(:recipe) { create(:recipe, user: user) }

  context "ログインしているユーザーの場合" do
    before do
      login_for_request(user)
      get new_recipe_path
    end

    it "レスポンスが正常に表示されること" do
      expect(response).to have_http_status "200"
      expect(response).to render_template('recipes/new')
    end

    xit "有効なレシピデータで登録できること" do
      expect {
        post recipes_path, params: { recipe: { name: "玄米握り",
                                               description: "お手軽料理です",
                                               portion: 1.5,
                                               tips: "海苔をたっぷり巻きましょう",
                                               episode: "何かを巻きたくて" } }
      }.to change(Recipe, :count).by(1)
      follow_redirect!
      expect(response).to render_template('recipes/show')
    end

    xit "無効なレシピデータでは登録できないこと（名前なし）" do
      expect {
        post recipes_path, params: { recipe: { name: "",
                                               description: "お手軽料理です",
                                               portion: 1.5,
                                               tips: "海苔をたっぷり巻きましょう",
                                               episode: "何かを巻きたくて" } }
      }.not_to change(Recipe, :count)
      expect(response).to render_template('recipes/new')
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      get new_recipe_path
      expect(response).to have_http_status "302"
      expect(response).to redirect_to new_user_session_path
    end
  end
end
