require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

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
      login_for_request(user)
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
    end
  end

  describe "プロフィール編集ページ" do
    before do
      login_for_request(user)
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
end
