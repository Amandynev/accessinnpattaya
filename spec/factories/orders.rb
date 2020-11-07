FactoryBot.define do
  factory :order do
    association :user, factory: :user
    amount_cents { Faker::Number.number(digits: 5) }
    state { "pending" }
    checkout_session_id { Faker::Number.number(digits: 10).to_s }
  end
end
