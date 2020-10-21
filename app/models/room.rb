class Room < ApplicationRecord
  belongs_to :category
  has_many :room_bookings
  has_many :bookings, through: :room_bookings

  SERVICES = ['open 24h/24h', 'wifi', 'air condition', 'minibar', 'room service', 'laundry', 'restaurant', 'bar', 'massage']

  def services
    SERVICES
  end
end
