require 'rails_helper'

RSpec.describe "Homeのpage", type: :system do
  describe "トップページ" do
    context "ページ全体" do
      before do
        visit root_path
      end

      it "玄米生活応援レシピの文字列が存在する" do
        expect(page).to have_content '玄米生活応援レシピ'
      end

      it "正しいタイトルが表示される" do
        expect(page).to have_title full_title
      end
    end
  end
end
