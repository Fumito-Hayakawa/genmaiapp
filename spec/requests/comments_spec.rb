require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:recipe) { create(:recipe) }
  let!(:comment) { create(:comment, user_id: user.id, recipe: recipe) }


  context "コメントの登録" do
    context "ログインしている場合" do
      before do
        login_for_request(user)
      end

      it "有効な内容のコメントが登録できること" do
        expect {
          post comments_path, params: { recipe_id: recipe.id,
                                        comment: { content: "美味しかったです！" } }
        }.to change(recipe.comments, :count).by(1)
      end

      it "無効な内容のコメントが登録できないこと" do
        expect {
          post comments_path, params: { recipe_id: recipe.id,
                                        comment: { content: "" } }
        }.not_to change(recipe.comments, :count)
      end
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
      context "コメントを作成したユーザーである場合" do
        it "コメントの削除ができること" do
          login_for_request(user)
          expect {
            delete comment_path(comment)
          }.to change(recipe.comments, :count).by(-1)
        end
      end

      context "コメントを作成したユーザーでない場合" do
        xit "コメントの削除はできないこと" do
          login_for_request(other_user)
            expect {
        　    delete comment_path(comment)
　          }.not_to change(recipe.comments, :count)
        end
      end
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
