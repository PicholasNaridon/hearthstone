FactoryGirl.define do
  factory :card do
    sequence(:name) { |n| "card#{n}" }
    sequence(:cardType) { |n| "card#{n}" }
    sequence(:faction) { |n| "card#{n}" }
    sequence(:rarity) { |n| "card#{n}" }
    sequence(:cost) { |n| "card#{n}" }
    sequence(:artist) { |n| "card#{n}" }
  end
end
