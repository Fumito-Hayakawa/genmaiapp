require 'rails_helper'

RSpec.describe "Recipes", type: :system do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:recipe) { create(:recipe, user: user) }
  let!(:comment) { create(:comment, user_id: user.id, recipe: recipe) }

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
        expect(page).to have_content '分量（〜人分）'
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
        expect(page).to have_content recipe.portion.to_i
        expect(page).to have_content recipe.tips
        expect(page).to have_content recipe.episode
      end
    end

    context "コメントの登録＆削除" do
      it "自分の料理に対するコメントの登録＆削除が正常に完了すること" do
        login_for_system(user)
        visit recipe_path(recipe)
        fill_in "comment_content", with: "玄米が柔らかかったです"
        click_button "コメント"
        within find("#comment-#{Comment.last.id}") do
          expect(page).to have_selector 'span', text: user.name
          expect(page).to have_selector 'span', text: '玄米が柔らかかったです'
        end
        expect(page).to have_content "コメントを投稿しました"
        click_link "削除", href: comment_path(Comment.last)
        expect(page).not_to have_selector 'span', text: '玄米が柔らかかったです'
        expect(page).to have_content "コメントを削除しました"
      end

      it "別ユーザーの料理のコメントには削除リンクが無いこと" do
        login_for_system(other_user)
        visit recipe_path(recipe)
        within find("#comment-#{comment.id}") do
          expect(page).to have_selector 'span', text: user.name
          expect(page).to have_selector 'span', text: comment.content
          expect(page).not_to have_link '削除', href: recipe_path(recipe)
        end
      end
    end
  end

  describe "レシピ一覧ページ" do
    context "ログインしている場合" do
      before do
        login_for_system(user)
        visit root_path
      end

      it "ログイン後の各ページに検索窓が表示されていること" do
        expect(page).to have_css 'form#recipe_search'
        visit new_recipe_path
        expect(page).to have_css 'form#recipe_search'
        visit favorites_path
        expect(page).to have_css 'form#recipe_search'
        visit users_path
        expect(page).to have_css 'form#recipe_search'
        visit user_profiles_path(user)
        expect(page).to have_css 'form#recipe_search'
        visit recipes_path
        expect(page).to have_css 'form#recipe_search'
        visit recipe_path(recipe)
        expect(page).to have_css 'form#recipe_search'
        visit edit_recipe_path(recipe)
      end

      it "検索ワードを入れずに検索ボタンを押した場合、レシピ一覧が表示されること" do
        fill_in 'q_name_or_ingredients_name_cont', with: ''
        click_button '検索'
        expect(page).to have_css 'h3', text: "レシピ一覧"
        within find('.recipes') do
          expect(page).to have_css '.recipe-box', count: Recipe.count
        end
      end
    end

    context "ログインしていない場合" do
      it "検索窓が表示されないこと" do
        visit root_path
        expect(page).not_to have_css 'form#recipe_search'
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
        expect(page).to have_content '分量（〜人分）'
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

  describe "feedページ" do
    before do
      login_for_system(user)
      visit feeds_path(user)
    end

    it "フィードの中から検索ワードに該当する結果が表示されること" do
      create(:recipe, name: 'かに玉', user: user)
      create(:recipe, name: 'かに鍋', user: other_user)
      create(:recipe, name: '野菜炒め', user: user)
      create(:recipe, name: '野菜カレー', user: other_user)

      # 誰もフォローしない場合
      fill_in 'q_name_or_ingredients_name_cont', with: 'かに'
      click_button '検索'
      expect(page).to have_css 'h3', text: 'フォローしているユーザーの"かに”のレシピ：1件'
      within find('.recipes') do
        expect(page).to have_css '.recipe-box', count: 1
      end
      fill_in 'q_name_or_ingredients_name_cont', with: '野菜'
      click_button '検索'
      expect(page).to have_css 'h3', text: 'フォローしているユーザーの"野菜”のレシピ：1件'
      within find('.recipes') do
        expect(page).to have_css '.recipe-box', count: 1
      end

      # other_userをフォローする場合
      user.follow(other_user)
      fill_in 'q_name_or_ingredients_name_cont', with: 'かに'
      click_button '検索'
      expect(page).to have_css 'h3', text: 'フォローしているユーザーの"かに”のレシピ：2件'
      within find('.recipes') do
        expect(page).to have_css '.recipe-box', count: 2
      end
      fill_in 'q_name_or_ingredients_name_cont', with: '野菜'
      click_button '検索'
      expect(page).to have_css 'h3', text: 'フォローしているユーザーの"野菜”のレシピ：2件'
      within find('.recipes') do
        expect(page).to have_css '.recipe-box', count: 2
      end
    end
  end
end
