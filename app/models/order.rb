class Order < ApplicationRecord
  belongs_to :user
  monetize :amount_cents
  validates :amount_cents, :checkout_session_id, presence: true
  validates :state, inclusion: { in: ["pending", "canceled", "paid"] }
end
