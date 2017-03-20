FactoryGirl.define do
  factory :deck do
    sequence(:name) { |n| "deck#{n}" }
  end
end
