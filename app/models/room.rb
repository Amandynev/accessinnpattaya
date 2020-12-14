class Room < ApplicationRecord
  belongs_to :category
  has_many :bookings

  SERVICES = ['page.rooms.safety-box', 'page.rooms.wifi', 'page.rooms.air-cond', 'page.rooms.minibar', 'page.rooms.lift', 'page.rooms.shower-room', 'page.rooms.room-service', 'page.rooms.laundry', 'page.rooms.parking']

end
