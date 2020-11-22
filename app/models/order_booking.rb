class OrderBooking < ApplicationRecord
  belongs_to :order
  belongs_to :booking
end
