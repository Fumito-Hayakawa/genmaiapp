require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let!(:recipe) { create(:recipe) }
  let!(:recipe_yesterday) { create(:recipe, :yesterday) }
  let!(:recipe_one_week_ago) { create(:recipe, :one_week_ago) }
  let!(:recipe_one_month_ago) { create(:recipe, :one_month_ago) }

  context "バリデーション" do
    it "有効な状態であること" do
      expect(recipe).to be_valid
    end

    it "名前がなければ無効な状態であること" do
      recipe = build(:recipe, name: nil)
      recipe.valid?
      expect(recipe.errors[:name]).to include("を入力してください")
    end

    it "名前が40文字以内であること" do
      recipe = build(:recipe, name: "あ" * 41)
      recipe.valid?
      expect(recipe.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "説明が200文字以内であること" do
      recipe = build(:recipe, description: "あ" * 201)
      recipe.valid?
      expect(recipe.errors[:description]).to include("は200文字以内で入力してください")
    end

    it "コツ・ポイントが80文字以内であること" do
      recipe = build(:recipe, tips: "あ" * 81)
      recipe.valid?
      expect(recipe.errors[:tips]).to include("は80文字以内で入力してください")
    end

    it "ユーザーIDがなければ無効な状態であること" do
      recipe = build(:recipe, user_id: nil)
      recipe.valid?
      expect(recipe.errors[:user_id]).to include("を入力してください")
    end

    it "エピソードが200文字以内であること" do
      recipe = build(:recipe, episode: "あ" * 201)
      recipe.valid?
      expect(recipe.errors[:episode]).to include("は200文字以内で入力してください")
    end
  end

  context "並び順" do
    it "直近の投稿が最初の投稿になっていること" do
      expect(recipe).to eq Recipe.first
    end
  end
end
