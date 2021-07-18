require 'rails_helper'

RSpec.describe "プロフィールページ", type: :request do
  let!(:user) { create(:user) }

  xit "レスポンスが正常に表示されること" do
    # 引数を2つ渡す必要があるが、書き方が分からずいったん放置。profileをcontroller直下とすることを検討中。"
    get user_profile_path(user)
    expect(response).to render_template('users/show')
  end
end
