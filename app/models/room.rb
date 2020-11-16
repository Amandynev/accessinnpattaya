class Room < ApplicationRecord
  belongs_to :category
  has_many :bookings

  SERVICES = ['safety box', 'wifi', 'air condition', 'minibar', 'lift', 'shower', 'room service', 'laundry', 'restaurant', 'bar', 'massage', 'Open 24h/24h']

  def services
    SERVICES
  end
end
