require "rails_helper"

RSpec.describe "レシピ編集", type: :request do
  let!(:user) { create(:user) }
  let!(:recipe) { create(:recipe, user: user) }
  let!(:other_user) { create(:user) }

  context "認可されたユーザーの場合" do
    it "レスポンスが正常に表示されること" do
      login_for_request(user)
      get edit_recipe_path(recipe)
      expect(response).to render_template('recipes/edit')
      patch recipe_path(recipe), params: { recipe: { name: "玄米トマトチーズリゾット",
                                               description: "玄米をトマト缶で煮込んだ料理です",
                                               portion: 1,
                                               tips: "鯖缶は塩鯖缶を使用",
                                               episode: "手軽な料理を食べたくて"} }
      redirect_to recipe
      follow_redirect!
      expect(response).to render_template('recipes/show')
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      # 編集
      get edit_recipe_path(recipe)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to new_user_session_path
      # 更新
      patch recipe_path(recipe), params: { recipe: { name: "玄米トマトチーズリゾット",
                                                  description: "玄米をトマト缶で煮込んだ料理です",
                                                  portion: 1,
                                                  tips: "鯖缶は塩鯖缶を使用",
                                                  episode: "手軽な料理を食べたくて"} }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to new_user_session_path
    end
  end

  context "別アカウントのユーザーの場合" do
    it "ホーム画面にリダイレクトすること" do
      # 編集
      login_for_request(other_user)
      get edit_recipe_path(recipe)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
      # 更新
      patch recipe_path(recipe), params: { recipe: { name: "玄米トマトチーズリゾット",
                                                  description: "玄米をトマト缶で煮込んだ料理です",
                                                  portion: 1,
                                                  tips: "鯖缶は塩鯖缶を使用",
                                                  episode: "手軽な料理を食べたくて"} }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
    end
  end
end