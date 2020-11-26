class Room < ApplicationRecord
  belongs_to :category
  has_many :bookings

  SERVICES = [I18n.t('page.rooms.safety-box'), I18n.t('page.rooms.wifi'), I18n.t('page.rooms.air-cond'), I18n.t('page.rooms.minibar'), I18n.t('page.rooms.lift'), I18n.t('page.rooms.shower-room'), I18n.t('page.rooms.room-service'), I18n.t('page.rooms.laundry'), I18n.t('page.rooms.parking')]

  def services
    SERVICES
  end
end
