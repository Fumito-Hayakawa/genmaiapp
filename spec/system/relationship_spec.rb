require 'rails_helper'

RSpec.describe "Relationships", type: :system do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:user3) { create(:user) }
  let!(:user4) { create(:user) }

  describe "フォロー中(following一覧)ページ" do
    before do
      create(:relationship, follower_id: user.id, followed_id: user2.id)
      create(:relationship, follower_id: user.id, followed_id: user3.id)
      login_for_system(user)
      visit following_user_path(user)
    end

    context "ページレイアウト" do
      it "「フォロー中」の文字列が存在すること" do
        expect(page).to have_content 'フォロー中'
      end

      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title('フォロー中')
      end

      it "ユーザー情報が表示されていること" do
        expect(page).to have_content user.name
        expect(page).to have_link "プロフィール", href: user_profiles_path(user)
        expect(page).to have_link "#{user.following.count}人をフォロー", href: following_user_path(user)
        expect(page).to have_link "#{user.followers.count}人のフォロワー", href: followers_user_path(user)
      end
    end
  end
end