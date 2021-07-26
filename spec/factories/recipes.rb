FactoryBot.define do
  factory :recipe do
    name { Faker::Food.recipe }
    description { "玄米に合うチーズを使った料理です" }
    tips { "手早く調理するのがおすすめ" }
    episode { "魚を釣っている時に思いつきました" }
    portion { 1.5 }
    association :user
  end
end
