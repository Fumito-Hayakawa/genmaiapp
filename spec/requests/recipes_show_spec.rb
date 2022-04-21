require "rails_helper"

RSpec.describe "レシピ詳細ページ", type: :request do
  let!(:user) { create(:user) }
  let!(:recipe) { create(:recipe, user: user) }

  it "レスポンスが正常に表示されること" do
    get recipe_path(recipe)
    expect(response).to have_http_status "200"
    expect(response).to render_template('recipes/show')
  end
end
