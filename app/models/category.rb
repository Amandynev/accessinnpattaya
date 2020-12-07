class Category < ApplicationRecord
  has_many :rooms
  validates :name, :description, :price, :room_size, presence: true
  validates :balcony, :corner_table, :smoking, inclusion: { in: [true, false] }
  monetize :price_cents
  translates :name, :description, :bed_size
end
