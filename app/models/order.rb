class Order < ApplicationRecord
  belongs_to :user
  has_many :order_bookings, dependent: :destroy
  has_many :bookings, through: :order_bookings
  monetize :amount_cents
  validates :amount_cents, presence: true
  validates :state, inclusion: { in: ["pending", "canceled", "paid"] }

  def paid?
    state == "paid"
  end
end
