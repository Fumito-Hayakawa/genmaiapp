require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  let!(:user) { create(:user) }

  before do
    visit new_user_session_path
  end

  describe "ログインページ" do
    context "ページレイアウト" do
      it "「ログイン」の文字列が存在すること" do
        expect(page).to have_content 'ログイン'
      end

      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title('ログイン')
      end

      it "ヘッダーにログインページへのリンクがあること" do
        expect(page).to have_link 'ログイン', href: new_user_session_path
      end

      it "ヘッダーにユーザー登録ページへのリンクがあること" do
        expect(page).to have_link 'ユーザー登録', href: new_user_registration_path
      end

      it "ログインフォームが正しく表示される" do
        expect(page).to have_css 'input#email_form'
        expect(page).to have_css 'input#email_form'
      end

      it "ログインボタンが表示される" do
        expect(page).to have_button 'ログイン'
      end
    end
  end
end
