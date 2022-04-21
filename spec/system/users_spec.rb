require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:recipe) { create(:recipe, user: user) }

  describe "ユーザー一覧ページ" do
    it "ぺージネーションが表示されること" do
      create_list(:user, 21)
      login_for_system(user)
      visit users_path
      expect(page).to have_css(".page-link")
    end
  end

  describe "ユーザー登録ページ" do
    before do
      visit new_user_registration_path
    end

    context "ページレイアウト" do
      it "「ユーザー登録」の文字列が存在する" do
        expect(page).to have_content 'ユーザー登録'
      end

      it "正しいタイトルが表示される" do
        expect(page).to have_title full_title('ユーザー登録')
      end
    end

    context "ユーザー登録処理" do
      it "有効なユーザーでユーザー登録を行うとユーザー登録成功のフラッシュが表示されること" do
        fill_in "name_form", with: "Example User"
        fill_in "email_form", with: "user@example.com"
        fill_in "password_form", with: "password"
        fill_in "password_confirmation_form", with: "password"
        click_button "登録完了する"
        expect(page).to have_content "アカウント登録が完了しました。"
      end

      it "無効なユーザーでユーザー登録を行うとユーザー登録失敗のフラッシュが表示されること" do
        fill_in "name_form", with: ""
        fill_in "email_form", with: ""
        fill_in "password_form", with: "password"
        fill_in "password_confirmation_form", with: "pass"
        click_button "登録完了する"
        expect(page).to have_content "ユーザー名が空になっています"
        expect(page).to have_content "確認用パスワードとパスワードの入力が一致しません"
        expect(page).to have_content "メールアドレスが空になっています"
      end
    end
  end

  describe "プロフィールページ" do
    before do
      # ログインする
      login_for_system(user)
      visit user_profiles_path(user)
    end

    context "ページレイアウト" do
      it "「プロフィール」の文字列が存在することを確認" do
        expect(page).to have_content 'プロフィール'
      end

      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title('プロフィール')
      end

      it "ユーザー情報が表示されることを確認" do
        expect(page).to have_content user.name
        expect(page).to have_content user.introduction
      end

      it "プロフィール編集ページへのリンクが表示されていることを確認" do
        expect(page).to have_link 'プロフィールを編集', href: edit_user_profiles_path(user)
      end
    end
  end

  describe "プロフィール編集ページ" do
    before do
      sign_in user
      visit user_profiles_path(user)
      click_link "プロフィールを編集"
    end

    it "有効なプロフィール更新を行うと、フラッシュが表示されること" do
      fill_in "name_form", with: "Editユーザー"
      fill_in "email_form", with: "edit-user@example.com"
      fill_in "introduction_form", with: "プロフィールを編集しました、こんにちは。"
      click_button "更新"
      expect(page).to have_content "プロフィールの情報を更新しました"
      expect(user.reload.name).to eq "Editユーザー"
      expect(user.reload.email).to eq "edit-user@example.com"
      expect(user.reload.introduction).to eq "プロフィールを編集しました、こんにちは。"
    end

    it "無効なプロフィール更新をしようとすると、適切なエラーメッセージが表示されること" do
      fill_in "name_form", with: ""
      fill_in "email_form", with: ""
      click_button "更新"
      expect(page).to have_content 'ユーザー名が空になっています'
      expect(page).to have_content 'メールアドレスが空になっています'
      expect(user.reload.email).not_to eq ""
    end
  end

  describe "アカウント編集ページ" do
    before do
      sign_in user
      visit user_accounts_path(user)
      click_link "パスワードを変更"
    end

    it "有効なアカウント更新を行うと、フラッシュが表示されること" do
      fill_in "password_form", with: "password"
      fill_in "password_confirmation_form", with: "password"
      click_button "更新"
      expect(page).to have_content "アカウントの情報を更新しました"
    end

    it "無効なプロフィール更新をしようとすると、適切なエラーメッセージが表示されること" do
      fill_in "password_form", with: "password"
      fill_in "password_confirmation_form", with: "password1"
      click_button "更新"
      expect(page).to have_content '確認用パスワードとパスワードの入力が一致しません'
      expect(user.reload.email).not_to eq user.password
    end
  end

  describe "レシピ投稿一覧ページ" do
    before do
      sign_in user
      create_list(:recipe, 10, user: user)
      visit user_recipes_path(user)
    end

    it "レシピの件数が表示されていること" do
      expect(page).to have_content "投稿レシピ一覧 (#{user.recipes.count}件)"
    end

    it "レシピの情報が表示されていること" do
      Recipe.take(8).each do |recipe|
        expect(page).to have_link recipe.name
        expect(page).to have_content recipe.description
      end
    end

    it "レシピのページネーションが表示されていることを確認" do
      expect(page).to have_css(".page-link")
    end
  end

  context "お気に入り登録/解除" do
    before do
      login_for_system(user)
    end

    it "レシピのお気に入り登録/解除ができること" do
      expect(user.favorite?(recipe)).to be_falsey
      user.favorite(recipe)
      expect(user.favorite?(recipe)).to be_truthy
      user.unfavorite(recipe)
      expect(user.favorite?(recipe)).to be_falsey
    end
  end
end
