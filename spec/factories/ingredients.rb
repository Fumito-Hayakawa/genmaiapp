FactoryBot.define do
  factory :ingredient do
    name "小豆"
    quantity "50g"
    association :recipe
  end
end
