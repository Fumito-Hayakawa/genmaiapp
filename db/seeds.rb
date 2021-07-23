User.create!(name:  "早川 史人",
  email: "admin@example.com",
  password:              "admin",
  password_confirmation: "admin",
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
