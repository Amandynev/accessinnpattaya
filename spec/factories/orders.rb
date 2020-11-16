FactoryBot.define do
  factory :order do
    association :user, factory: :user
    amount_cents { Faker::Number.number(digits: 5) }
    state { "pending" }
  end
end
