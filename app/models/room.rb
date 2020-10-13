class Room < ApplicationRecord
  belongs_to :category
  has_many :bookings

  SERVICES = ['open 24h/24h','wifi', 'air condition', 'minibar', 'room service', 'laundry', 'restaurant', 'bar','massage']

  def services
    SERVICES
  end
end
