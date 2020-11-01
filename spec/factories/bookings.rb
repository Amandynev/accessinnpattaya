FactoryBot.define do
  factory :booking do
    start_at { Date.today + 1 }
    end_at { Date.today + 3 }
    room { Room.all.sample }
    association :user, factory: :user
    state { "pending" }
  end
end
