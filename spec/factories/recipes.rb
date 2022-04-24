FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    description { "玄米に合うチーズを使った料理です" }
    tips { "手早く調理するのがおすすめ" }
    episode { "魚を釣っている時に思いつきました" }
    portion { 2 }
    association :user
    created_at { Time.current } # 追記
  end

  trait :yesterday do
    created_at { 1.day.ago }
  end

  trait :one_week_ago do
    created_at { 1.week.ago }
  end

  trait :one_month_ago do
    created_at { 1.month.ago }
  end
end
