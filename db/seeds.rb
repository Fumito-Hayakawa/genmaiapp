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
      name: "野菜玄米カレー",
      user_id: 1,
      description: description1,
      portion: portion,
      tips: tips1,
      episode: episode1,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe1.jpg")), filename: "recipe1.jpg"),
      ingredients_attributes: [
                                { name: "豚こまぎれ肉", quantity: "300g" },
                                { name: "じゃがいも", quantity: "2個" },
                                { name: "にんじん", quantity: "1本" },
                                { name: "玉ねぎ", quantity: "1個" },
                                { name: "カレー粉", quantity: "大さじ2" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
      procedures_attributes: [
                                { number: 1, how_to_use: "野菜は皮を剥き、適当な大きさに切る。" },
                                { number: 2, how_to_use: "レトルトカレーの表示に従ってカレーを作る。やや濃いめに作る。" },
                                { number: 3, how_to_use: "玄米は塩を少なめで炊いておく。カレーと玄米を盛り付ける。" },
                                { number: 4, how_to_use: "" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
                              ],
    },
    {
      name: "玄米ガパオライス",
      user_id: 2,
      description: description2,
      portion: portion,
      tips: tips2,
      episode: episode2,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe2.jpg")), filename: "recipe2.jpg"),
      ingredients_attributes: [
                                { name: "玄米", quantity: "2合分" },
                                { name: "鶏ひき肉", quantity: "100g" },
                                { name: "玉ねぎ", quantity: "半玉" },
                                { name: "しょうゆ", quantity: "大さじ1" },
                                { name: "砂糖", quantity: "小さじ1" },
                                { name: "ナンプラー", quantity: "小さじ1" },
                                { name: "水", quantity: "100cc" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
      procedures_attributes: [
                                { number: 1, how_to_use: "玄米は塩を少なめで炊いておく。" },
                                { number: 2, how_to_use: "玉ねぎをみじん切りする。" },
                                { number: 3, how_to_use: "鶏ひき肉をサラダ油で炒める。火が通ったら玉ねぎを加えて3分炒める。" },
                                { number: 4, how_to_use: "水、醤油、砂糖、ナンプラーを加えて水気がなくなるまで炒める。" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
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
        procedures_attributes: [
                                { number: 1, how_to_use: "卵を溶いておく。" },
                                { number: 2, how_to_use: "卵とかに玉の素を混ぜて鍋で炒める。" },
                                { number: 3, how_to_use: "" },
                                { number: 4, how_to_use: "" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
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
                                { name: "しょうゆ", quantity: "大さじ1" },
                                { name: "みりん", quantity: "大さじ2" },
                                { name: "酒", quantity: "大さじ1" },
                                { name: "おろししょうが", quantity: "1片分" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
        procedures_attributes: [
                                { number: 1, how_to_use: "玉ねぎはくし切りにしておく。" },
                                { number: 2, how_to_use: "サラダ油をひいて、豚肉を炒める。火が通ったら玉ねぎを加える。玉ねぎがしんなりしてきたら調味料を加え、煮絡める。" },
                                { number: 3, how_to_use: "" },
                                { number: 4, how_to_use: "" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
                              ],
    },
    {
      name: "玄米コーンリゾット",
      user_id: 2,
      description: description3,
      portion: portion,
      tips: tips2,
      episode: episode2,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe5.jpg")), filename: "recipe5.jpg"),
      ingredients_attributes: [
                                { name: "玄米", quantity: "一人分" },
                                { name: "コーンスープの素", quantity: "一袋" },
                                { name: "お湯", quantity: "適量" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
        procedures_attributes: [
                                { number: 1, how_to_use: "コーンスープの素に記載のお湯を沸かし、そこに炊いた玄米と素を投入する。" },
                                { number: 2, how_to_use: "少し煮たら完成。" },
                                { number: 3, how_to_use: "" },
                                { number: 4, how_to_use: "" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
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
                                { name: "鶏もも肉", quantity: "300g" },
                                { name: "塩", quantity: "少々" },
                                { name: "胡椒", quantity: "少々" },
                                { name: "おろしにんにく", quantity: "小さじ1" },
                                { name: "トマトケチャップ", quantity: "大さじ2" },
                                { name: "オリーブオイル", quantity: "大さじ2" },
                                { name: "カレー粉", quantity: "大さじ1" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
        procedures_attributes: [
                                { number: 1, how_to_use: "鶏もも肉は塩・胡椒をすり込んでおく。" },
                                { number: 2, how_to_use: "残りの調味料を合わせて鶏肉に揉み込み、冷蔵庫で1時間ほど置いておく。" },
                                { number: 3, how_to_use: "フライパンにオリーブオイルを熱し、鶏肉を両面こんがりと焼く。" },
                                { number: 4, how_to_use: "" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
                              ],
    },
    {
      name: "寝かせ玄米",
      user_id: 1,
      description: description3,
      portion: portion,
      tips: tips3,
      episode: episode3,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe7.jpg")), filename: "recipe7.jpg"),
      ingredients_attributes: [
                                { name: "玄米", quantity: "4合" },
                                { name: "塩", quantity: "小さじ1/6" },
                                { name: "乾燥小豆", quantity: "20g" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
      procedures_attributes: [
                                { number: 1, how_to_use: "玄米は水で手を使ってもみ洗いしておく。" },
                                { number: 2, how_to_use: "圧力鍋に玄米と塩、小豆、水950mlを入れる。" },
                                { number: 3, how_to_use: "圧力調理を20分、その後火を止めて15分蒸らしたら圧力を抜く。" },
                                { number: 4, how_to_use: "70度の温度が保てる保温ジャーに炊いた玄米を入れる。3〜4日目が食べごろ。7日頃には硬くなってしまうので、それまでに食べる。" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
                              ],
    },
    {
      name: "玄米リゾット",
      user_id: 2,
      description: description2,
      portion: portion,
      tips: tips2,
      episode: episode2,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe8.jpg")), filename: "recipe8.jpg"),
      ingredients_attributes: [
                                { name: "玄米", quantity: "2人分" },
                                { name: "ベーコン", quantity: "50g" },
                                { name: "水", quantity: "100ml" },
                                { name: "コンソメ", quantity: "小さじ1/2" },
                                { name: "チーズ", quantity: "50g" },
                                { name: "黒胡椒", quantity: "適量" },
                                { name: "牛乳", quantity: "150ml" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
      procedures_attributes: [
                                { number: 1, how_to_use: "ベーコンを先に炒めてから水、牛乳、チーズ、コンソメを鍋に入れて火にかける。沸騰したら炊いた玄米を投入する。" },
                                { number: 2, how_to_use: "少し煮たら黒胡椒を振る。" },
                                { number: 3, how_to_use: "" },
                                { number: 4, how_to_use: "" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
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
        procedures_attributes: [
                                { number: 1, how_to_use: "卵を溶いておく。" },
                                { number: 2, how_to_use: "フライパンにオリーブオイルを引いて溶いた卵とチーズを入れる。固まってきたら成形し、胡椒を振る。" },
                                { number: 3, how_to_use: "" },
                                { number: 4, how_to_use: "" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
                              ],
    },
    {
      name: "玄米チャーハン",
      user_id: 1,
      description: description3,
      portion: portion,
      tips: tips3,
      episode: episode3,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe10.jpg")), filename: "recipe10.jpg"),
      ingredients_attributes: [
                                { name: "卵", quantity: "1個" },
                                { name: "にんじん", quantity: "半分" },
                                { name: "玉ねぎ", quantity: "0.5個" },
                                { name: "ごま油", quantity: "少々" },
                                { name: "醤油", quantity: "小さじ1" },
                                { name: "にんにく", quantity: "1かけ" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
      procedures_attributes: [
                                { number: 1, how_to_use: "玄米、卵、塩胡椒を混ぜておく。" },
                                { number: 2, how_to_use: "ごま油で刻んだにんにくを炒め、香りが出たら玉ねぎとにんじんを入れる。火が通ったら1の玄米を入れて炒める。" },
                                { number: 3, how_to_use: "" },
                                { number: 4, how_to_use: "" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
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
        procedures_attributes: [
                                { number: 1, how_to_use: "たれ（しょうゆ、みりん、酒）をよく混ぜておく。" },
                                { number: 2, how_to_use: "フライパンに油をひき、ぶりを皮目から焼く。両面に焼き色がついたら蓋をして2分蒸し焼きにする。" },
                                { number: 3, how_to_use: "たれをかけて弱火にする。ときどきスプーンでたれをぶりに振りかけながら7分ほど焼く。汁気が少なくなってきたら出来上がり。" },
                                { number: 4, how_to_use: "" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
                              ],
    },
    {
      name: "玄米トマトリゾット",
      user_id: 3,
      description: description1,
      portion: portion,
      tips: tips1,
      episode: episode1,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe12.jpg")), filename: "recipe12.jpg"),
      ingredients_attributes: [
                                { name: "玄米", quantity: "2人分" },
                                { name: "玉ねぎ", quantity: "3個" },
                                { name: "にんじん", quantity: "3本" },
                                { name: "トマト缶", quantity: "1缶" },
                                { name: "コンソメ", quantity: "小さじ1" },
                                { name: "塩", quantity: "小さじ1/3" },
                                { name: "とろけるチーズ", quantity: "お好みで" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
        procedures_attributes: [
                                { number: 1, how_to_use: "玉ねぎはくし切り、にんじんはみじん切りする。" },
                                { number: 2, how_to_use: "オリーブオイルで玉ねぎ、にんじんを炒める。" },
                                { number: 3, how_to_use: "トマト缶、コンソメを加えて、水200mLを加えて5分煮る。" },
                                { number: 4, how_to_use: "炊いた玄米を加えて、塩で味付けする。お好みでチーズを加える。" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
                              ],
    },
    {
      name: "ラタトュイユ",
      user_id: 1,
      description: description1,
      portion: portion,
      tips: tips3,
      episode: episode1,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe13.jpg")), filename: "recipe13.jpg"),
      ingredients_attributes: [
                                { name: "なす", quantity: "3個" },
                                { name: "しめじ", quantity: "一袋" },
                                { name: "ブイヨン", quantity: "小さじ1" },
                                { name: "トマト缶", quantity: "1缶" },
                                { name: "チーズ", quantity: "30g" },
                                { name: "鶏肉", quantity: "200g" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
      procedures_attributes: [
                                { number: 1, how_to_use: "なす、鶏肉を食べやすい大きさに切る。しめじは石突を取り除く。" },
                                { number: 2, how_to_use: "油でにんにくを炒めて、香りが出たら鶏肉を炒める。火が通ったら取り出す。" },
                                { number: 3, how_to_use: "なす、しめじを炒めて火を通す。" },
                                { number: 4, how_to_use: "トマト缶、ブイヨン、鶏肉を加えて煮る。" },
                                { number: 5, how_to_use: "汁気がなくなってきたらチーズを加え、一煮立ちさせたら完成。" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
                              ],
    },
    {
      name: "キーマカレー",
      user_id: 2,
      description: description2,
      portion: portion,
      tips: tips1,
      episode: episode1,
      recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("./public/images/recipe14.jpg")), filename: "recipe14.jpg"),
      ingredients_attributes: [
                                { name: "玉ねぎ", quantity: "2玉" },
                                { name: "牛豚ひき肉", quantity: "200g" },
                                { name: "キーマカレーの素", quantity: "記載の分量" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" },
                                { name: "", quantity: "" }
                              ],
        procedures_attributes: [
                                { number: 1, how_to_use: "サラダ油を引いて、ひき肉を炒める。火が通ったら刻んだ玉ねぎを加える。" },
                                { number: 2, how_to_use: "火が通ったら水を加えて、沸騰したらキーマカレーの素を投入する。" },
                                { number: 3, how_to_use: "10分煮込んだら完成。" },
                                { number: 4, how_to_use: "" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
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
        procedures_attributes: [
                                { number: 1, how_to_use: "ごぼうは1ミリ幅に斜め切りする。にんじん、大根は乱切りする。こんにゃくは2ミリ幅に切る。長ネギは斜め切りする。" },
                                { number: 2, how_to_use: "鍋にごま油を引いて熱し、豚肉を炒める。酒を加えて火が通ったら1の野菜を投入して火が透るまで炒める。" },
                                { number: 3, how_to_use: "水を1L入れて沸騰後15分煮る。" },
                                { number: 4, how_to_use: "味噌を入れて味を整える。" },
                                { number: 5, how_to_use: "" },
                                { number: 6, how_to_use: "" },
                                { number: 7, how_to_use: "" },
                                { number: 8, how_to_use: "" },
                                { number: 9, how_to_use: "" },
                                { number: 10, how_to_use: "" }
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