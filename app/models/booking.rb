class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one :category, through: :room
  validates :start_at, :end_at, presence: true
  validate :start_at_cannot_be_in_the_past
  validate :end_at_cannot_be_before_start_at

  scope :user_bookings, lambda { |user|
    where(user_id: user.id, state: "pending")
  }

  scope :user_bookings_category, lambda { |user, category|
  where(user_id: user.id, room: category.rooms, state: "pending")
}

  def start_at_cannot_be_in_the_past
    return errors.add(:start_at, "ne peut pas être une date passée") if start_at.present? && start_at < Date.today
  end

  def end_at_cannot_be_before_start_at
    return errors.add(:end_at, "ne peut pas être avant la date de début") if start_at.present? && end_at.present? && end_at <= start_at
  end

  def price_book
    price = 0
    rooms.each do |room|
      price += room.category.price * (end_at - start_at).to_i
    end
    price
  end

  def price
    (end_at - start_at).to_i * room.category.price_cents
  end
end
