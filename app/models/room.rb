class Room < ApplicationRecord
  belongs_to :category
  has_many :bookings

  SERVICES = ['wifi', 'air conditionné', 'minibar']

  def services
    SERVICES
  end
end
