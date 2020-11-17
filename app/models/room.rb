class Room < ApplicationRecord
  belongs_to :category
  has_many :bookings

  SERVICES = ['Safety box', 'Wifi', 'Air condition', 'Minibar', 'Lift', 'Shower room', 'Room service', 'Laundry service', 'Parking']

  def services
    SERVICES
  end
end
