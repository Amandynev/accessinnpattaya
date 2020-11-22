class Order < ApplicationRecord
  belongs_to :user
  has_many :order_bookings
  has_many :bookings, through: :order_bookings
  monetize :amount_cents
  validates :amount_cents, presence: true
  validates :state, inclusion: { in: ["pending", "canceled", "paid"] }
end
