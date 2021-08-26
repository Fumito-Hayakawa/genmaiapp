require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  context "バリデーション" do
    it "名前、メールアドレスがあれば有効な状態であること" do
      expect(user).to be_valid
    end

    it "名前がなければ無効な状態であること" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("が空になっています")
    end

    it "名前が40文字以内であること" do
      user = build(:user, name: "a" * 41)
      user.valid?
      expect(user.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "メールアドレスがなければ無効な状態であること" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が空になっています")
    end

    it "メールアドレスが255文字以内であること" do
      user = build(:user, email: "#{"a" * 244}@example.com")
      user.valid?
      expect(user.errors[:email]).to include("は255文字以内で入力してください")
    end

    it "重複したメールアドレスなら無効な状態であること" do
      other_user = build(:user, email: user.email)
      other_user.valid?
      expect(other_user.errors[:email]).to include("はすでに存在します")
    end

    it "メールアドレスは小文字で保存されること" do
      email = "EXAMPLE@example.com"
      user = create(:user, email: email)
      expect(user.email).to eq email.downcase
    end

    it "パスワードがなければ無効な状態であること" do
      user = build(:user, password: nil, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password]).to include("が空になっています")
    end

    it "パスワードが6文字以上であること" do
      user = build(:user, password: "a" * 6, password_confirmation: "a" * 6)
      user.valid?
      expect(user).to be_valid
    end

    it "パスワードが5文字以下の場合エラーであること" do
      user = build(:user, password: "a" * 5, password_confirmation: "a" * 5)
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "紹介文が400文字以内であること" do
      user = build(:user, introduction: "a" * 401)
      user.valid?
      expect(user.errors[:introduction]).to include("は400文字以内で入力してください")
    end
  end

  context "フォロー機能" do
    it "フォローとアンフォローが正常に動作すること" do
      expect(user.following?(other_user)).to be_falsey
      user.follow(other_user)
      expect(user.following?(other_user)).to be_truthy
      expect(other_user.followed_by?(user)).to be_truthy
      user.unfollow(other_user)
      expect(user.following?(other_user)).to be_falsey
    end
  end
end
