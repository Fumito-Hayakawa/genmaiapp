FactoryBot.define do
  factory :comment do
    user_id { 1 }
    content { "とても美味しかったです！グラノーラを加えてアレンジしました" }
    association :recipe
  end
end
