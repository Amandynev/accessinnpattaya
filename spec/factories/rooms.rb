FactoryBot.define do
  factory :room do
    association :category, factory: :category
  end
end
