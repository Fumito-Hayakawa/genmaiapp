require 'rails_helper'

RSpec.describe "Recipes", type: :system do
  let!(:user) { create(:user) }

  describe "料理登録ページ" do
    before do
      login_for_system(user)
      visit new_recipe_path
    end

    context "ページレイアウト" do
      it "「レシピ登録」の文字列が存在すること" do
        expect(page).to have_content 'レシピ登録'
      end

      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title('レシピの登録')
      end

      it "入力部分に適切なラベルが表示されること" do
        expect(page).to have_content 'レシピ名'
        expect(page).to have_content '分量（例：2人分）'
        expect(page).to have_content 'レシピの説明'
        expect(page).to have_content 'レシピのポイント'
        expect(page).to have_content 'このレシピの生い立ち'
      end
    end

    context "レシピ登録処理" do
      it "有効な情報で料理登録を行うと料理登録成功のフラッシュが表示されること" do
        fill_in "name_form", with: "玄米握り"
        fill_in "portion_form", with: 1.5
        fill_in "description_form", with: "海苔で巻きます"
        fill_in "tips_form", with: "ピリッと辛めに味付けするのがオススメ"
        fill_in "episode_form", with: "そのまま食べることに飽きたため"
        click_button "レシピ登録"
        expect(page).to have_content "レシピの登録が完了しました！"
      end

      it "無効な情報で料理登録を行うと料理登録失敗のフラッシュが表示されること" do
        fill_in "name_form", with: ""
        fill_in "portion_form", with: 1.5
        fill_in "description_form", with: "海苔で巻きます"
        fill_in "tips_form", with: "ピリッと辛めに味付けするのがオススメ"
        fill_in "episode_form", with: "そのまま食べることに飽きたため"
        click_button "レシピ登録"
        expect(page).to have_content "レシピ名を入力してください"
      end
    end
  end
end