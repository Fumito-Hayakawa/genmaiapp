FactoryBot.define do
  factory :recipe do
    name "MyString"
    description "MyText"
    tips "MyText"
    episode "MyText"
    portion 1.5
    user nil
  end
end
