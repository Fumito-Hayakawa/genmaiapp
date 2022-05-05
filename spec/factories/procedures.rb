FactoryBot.define do
  factory :procedure do
    how_to_use "醤油を加えて煮る"
    number 1
    association :recipe
  end
end
