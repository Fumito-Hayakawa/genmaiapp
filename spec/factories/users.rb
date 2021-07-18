FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "example#{n}@example.com" }
    password { "genmai" }
    password_confirmation { "genmai" }
    introduction { "はじめまして。玄米料理が好きです" }
  end
end