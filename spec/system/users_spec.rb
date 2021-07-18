require 'rails_helper'

RSpec.describe "Users", type: :system do
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
    context "ページレイアウト" do
      before do
        visit user_path(user)
      end
 
      xit "「プロフィール」の文字列が存在することを確認" do
        expect(page).to have_content 'プロフィール'
      end
 
      xit "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title('プロフィール')
      end
  
      xit "ユーザー情報が表示されることを確認" do
        expect(page).to have_content user.name
        expect(page).to have_content user.introduction
      end
    end
  end
end
