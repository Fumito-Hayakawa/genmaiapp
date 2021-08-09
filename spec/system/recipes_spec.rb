require 'rails_helper'

RSpec.describe "Recipes", type: :system do
  let!(:user) { create(:user) }
  let!(:recipe) { create(:recipe, user: user) }

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

      it "適切なラベルが表示されること" do
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

  describe "料理詳細ページ" do
    context "ページレイアウト" do
      before do
        login_for_system(user)
        visit recipe_path(recipe)
      end

      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title("#{recipe.name}")
      end

      it "レシピ情報が表示されること" do
        expect(page).to have_content recipe.name
        expect(page).to have_content recipe.description
        expect(page).to have_content recipe.portion
        expect(page).to have_content recipe.tips
        expect(page).to have_content recipe.episode
      end
    end
  end

  describe "レシピ編集ページ" do
    before do
      login_for_system(user)
      visit recipe_path(recipe)
      click_link "編集"
    end

    context "ページレイアウト" do
      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title('レシピの編集')
      end

      it "ラベルが表示されること" do
        expect(page).to have_content 'レシピ名'
        expect(page).to have_content '分量（例：2人分）'
        expect(page).to have_content 'レシピの説明'
        expect(page).to have_content 'レシピのポイント'
        expect(page).to have_content 'このレシピの生い立ち'
      end
    end

    context "レシピの更新処理" do
      it "有効な更新" do
        fill_in "name_form", with: "玄米トマトチーズリゾット"
        fill_in "description_form", with: "玄米をトマト缶で煮込んだ料理です"
        fill_in "portion_form", with: 5
        fill_in "tips_form", with: "鯖缶は塩鯖缶を使用"
        fill_in "episode_form", with: "手軽な料理を食べたくて"
        click_button "レシピの編集"
        expect(page).to have_content "レシピ情報が更新されました！"
        expect(recipe.reload.name).to eq "玄米トマトチーズリゾット"
        expect(recipe.reload.description).to eq "玄米をトマト缶で煮込んだ料理です"
        expect(recipe.reload.portion).to eq 5
        expect(recipe.reload.tips).to eq "鯖缶は塩鯖缶を使用"
        expect(recipe.reload.episode).to eq "手軽な料理を食べたくて"
      end

      it "無効な更新" do
        fill_in "name_form", with: ""
        click_button "レシピの編集"
        expect(page).to have_content 'レシピ名を入力してください'
        expect(recipe.reload.name).not_to eq ""
      end
    end
  end
end