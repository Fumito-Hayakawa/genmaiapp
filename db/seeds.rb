User.create!(name:  "早川 史人",
  email: "admin@example.com",
  password:              "adminpassword",
  password_confirmation: "adminpassword",
  admin: true)

99.times do |n|
name  = Faker::Name.name
email = "sample-#{n+1}@example.com"
password = "password"
introduction = "こんにちは"
User.create!(name:  name,
    email: email,
    introduction: introduction,
    password:              password,
    password_confirmation: password)
end

10.times do |n|
  Recipe.create!(name: Faker::Food.dish,
               description: Faker::Food.description,
               tips: "手早く調理するのがおすすめ",
               episode: "魚を釣っている時に思いつきました",
               portion: 1.5,
               user_id: 1)
end

リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }