require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let!(:user) { create(:user) }
  let!(:recipe) { create(:recipe) }
  let!(:comment) { create(:comment, user_id: user.id, recipe: recipe) }

  context "コメントの登録" do
    context "ログインしている場合" do
    end

    context "ログインしていない場合" do
      it "コメントは登録できず、ログインページへリダイレクトすること" do
        expect {
          post comments_path, params: { recipe_id: recipe.id,
                                        comment: { content: "最高です！" } }
        }.not_to change(recipe.comments, :count)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "コメントの削除" do
    context "ログインしている場合" do
    end

    context "ログインしていない場合" do
      it "コメントの削除はできず、ログインページへリダイレクトすること" do
        expect {
          delete comment_path(comment)
        }.not_to change(recipe.comments, :count)
      end
    end
  end
end
