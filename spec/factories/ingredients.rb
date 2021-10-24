FactoryBot.define do
  factory :ingredient do
    name "小豆"
    quantigy "50g"
    association :recipe
  end
end
