# ユーザー
User.create!(
  [
    {
      name:  "早川 史人",
      email: "admin@example.com",
      password:              "adminpassword",
      password_confirmation: "adminpassword",
      admin: true,
    },
    {
      name:  "鈴木 恵子",
      email: "suzuki@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "採用 太郎",
      email: "recruit@example.com",
      password:              "password",
      password_confirmation: "password",
    },
  ]
)

# フォロー関係
user1 = User.find_by(id: 1)
user2 = User.find_by(id: 2)
user3 = User.find_by(id: 3)
user3.follow(user1)
user3.follow(user2)

# レシピ
portion = 2
description1 = "冬に食べたくなる、身体が温まる料理です。"
description2 = "栄養バランスが良いオススメ料理です。"
description3 = "スピード重視の簡単料理！"
tips1 = "野菜を事前に煮込んで柔らかくしておくと良いです！"
tips2 = "隠し味の胡椒がポイント！"
tips3 = "少し焦げ目をつけると美味しいです！"
episode1 = "妻から喜んでもらえました。"
episode2 = "手軽に玄米を楽しめるように考えました。"
episode3 = "栄養バランスの良い食事にしたいと思い。"

# 3ユーザー、それぞれ5料理ずつ作成
Recipe.create!(
  [
    {
      name: "肉じゃが",
      user_id: 1,
      description: description1,
      portion: portion,
      tips: tips1,
      episode: episode1,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe1.jpg")), filename: "recipe1.jpg"),
      ingredients_attributes: [
                                { name: "豚ロース肉", quantity: "300g" },
                                { name: "じゃがいも", quantity: "2個" },
                                { name: "にんじん", quantity: "1本" },
                                { name: "玉ねぎ", quantity: "1個" },
                                { name: "しょうゆ", quantity: "大さじ2" },
                                { name: "みりん", quantity: "大さじ2" },
                                { name: "酒", quantity: "大さじ2" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "ソーセージと卵の炒め物",
      user_id: 2,
      description: description2,
      portion: portion,
      tips: tips2,
      episode: episode2,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe2.jpg")), filename: "recipe2.jpg"),
      ingredients_attributes: [
                                { name: "ソーセージ", quantity: "4本" },
                                { name: "卵", quantity: "2個" },
                                { name: "胡椒", quantity: "少々" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "かに玉",
      user_id: 3,
      description: description3,
      portion: portion,
      tips: tips3,
      episode: episode3,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe3.jpg")), filename: "recipe3.jpg"),
      ingredients_attributes: [
                                { name: "卵", quantity: "6個" },
                                { name: "かに玉の素", quantity: "1袋" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "豚こまの生姜焼き",
      user_id: 1,
      description: description2,
      portion: portion,
      tips: tips2,
      episode: episode2,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe4.jpg")), filename: "recipe4.jpg"),
      ingredients_attributes: [
                                { name: "豚こま切れ肉", quantity: "100g" },
                                { name: "玉ねぎ", quantity: "1個" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "鶏肉のチーズ照り焼き",
      user_id: 2,
      description: description3,
      portion: portion,
      tips: tips2,
      episode: episode2,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe5.jpg")), filename: "recipe5.jpg"),
      ingredients_attributes: [
                                { name: "鶏肉", quantity: "100g" },
                                { name: "チーズ", quantity: "3枚" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "タンドリーチキン",
      user_id: 3,
      description: description2,
      portion: portion,
      tips: tips2,
      episode: episode2,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe6.jpg")), filename: "recipe6.jpg"),
      ingredients_attributes: [
                                { name: "鶏胸肉", quantity: "300g" },
                                { name: "塩", quantity: "少々" },
                                { name: "胡椒", quantity: "少々" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "鶏肉の味噌照り焼き",
      user_id: 1,
      description: description3,
      portion: portion,
      tips: tips3,
      episode: episode3,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe7.jpg")), filename: "recipe7.jpg"),
      ingredients_attributes: [
                                { name: "鶏肉", quantity: "250g" },
                                { name: "味噌", quantity: "大さじ1" },
                                { name: "玉ねぎ", quantity: "0.5個" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "豚しゃぶレタス",
      user_id: 2,
      description: description2,
      portion: portion,
      tips: tips2,
      episode: episode2,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe8.jpg")), filename: "recipe8.jpg"),
      ingredients_attributes: [
                                { name: "レタス", quantity: "1/4個" },
                                { name: "しゃぶしゃぶ用豚肉", quantity: "100g" },
                                { name: "三つ葉", quantity: "2束" },
                                { name: "胡椒", quantity: "1振り" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "チーズオムレツ",
      user_id: 3,
      description: description3,
      portion: portion,
      tips: tips3,
      episode: episode3,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe9.jpg")), filename: "recipe9.jpg"),
      ingredients_attributes: [
                                { name: "卵", quantity: "2個" },
                                { name: "とろけるチーズ", quantity: "大さじ2" },
                                { name: "オリーブオイル", quantity: "小さじ2" },
                                { name: "胡椒", quantity: "少々" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                 { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "スペインオムレツ",
      user_id: 1,
      description: description3,
      portion: portion,
      tips: tips3,
      episode: episode3,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe10.jpg")), filename: "recipe10.jpg"),
      ingredients_attributes: [
                                { name: "卵", quantity: "4個" },
                                { name: "じゃがいも", quantity: "1個" },
                                { name: "玉ねぎ", quantity: "0.5個" },
                                { name: "胡椒", quantity: "少々" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "ぶりの照り焼き",
      user_id: 2,
      description: description1,
      portion: portion,
      tips: tips3,
      episode: episode3,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe11.jpg")), filename: "recipe11.jpg"),
      ingredients_attributes: [
                                { name: "ブリ", quantity: "6枚" },
                                { name: "しょうゆ", quantity: "40ml" },
                                { name: "みりん", quantity: "100ml" },
                                { name: "酒", quantity: "80ml" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "カレーライス",
      user_id: 3,
      description: description1,
      portion: portion,
      tips: tips1,
      episode: episode1,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe12.jpg")), filename: "recipe12.jpg"),
      ingredients_attributes: [
                                { name: "鶏肉", quantity: "500g" },
                                { name: "玉ねぎ", quantity: "3個" },
                                { name: "にんじん", quantity: "3本" },
                                { name: "じゃがいも", quantity: "2個" },
                                { name: "なす", quantity: "1個" },
                                { name: "カレールー", quantity: "0.5箱" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "麻婆豆腐",
      user_id: 1,
      description: description1,
      portion: portion,
      tips: tips3,
      episode: episode1,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe13.jpg")), filename: "recipe13.jpg"),
      ingredients_attributes: [
                                { name: "牛ひき肉", quantity: "50g" },
                                { name: "絹豆腐", quantity: "2丁" },
                                { name: "麻婆豆腐の素", quantity: "1袋" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "肉豆腐",
      user_id: 2,
      description: description2,
      portion: portion,
      tips: tips1,
      episode: episode1,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe14.jpg")), filename: "recipe14.jpg"),
      ingredients_attributes: [
                                { name: "大葉", quantity: "4枚" },
                                { name: "薄切り肉", quantity: "100g" },
                                { name: "豆腐", quantity: "1/2丁" },
                                { name: "きのこ", quantity: "60g" },
                                { name: "しらたき", quantity: "50g" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
    },
    {
      name: "豚汁",
      user_id: 3,
      description: description1,
      portion: portion,
      tips: tips1,
      episode: episode3,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe15.jpg")), filename: "recipe15.jpg"),
      ingredients_attributes: [
                                { name: "豚肉", quantity: "150g" },
                                { name: "ごぼう", quantity: "1/2本" },
                                { name: "にんじん", quantity: "1本" },
                                { name: "大根", quantity: "1/8本" },
                                { name: "こんにゃく", quantity: "50g" },
                                { name: "長ネギ", quantity: "1/2本" },
                                { name: "ごま油", quantity: "大さじ1" },
                                { name: "味噌", quantity: "大さじ4" },
                                { name: "酒", quantity: "大さじ1" },
                                { name: "七味唐辛子", quantity: "お好み" }
                              ],
    }
  ]
)

recipe3 = Recipe.find(3)
recipe6 = Recipe.find(6)
recipe12 = Recipe.find(12)
recipe13 = Recipe.find(13)
recipe14 = Recipe.find(14)
recipe15 = Recipe.find(15)

# お気に入り登録
user3.favorite(recipe13)
user3.favorite(recipe14)
user1.favorite(recipe15)
user2.favorite(recipe12)

# コメント
recipe15.comments.create(user_id: user1.id, content: "美味しくて満足です！")
recipe12.comments.create(user_id: user2.id, content: "ちょうどいい味でした。")