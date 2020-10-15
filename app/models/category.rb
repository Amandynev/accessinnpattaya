class Category < ApplicationRecord
  has_many :rooms
  validates :name, :description, :price, :room_size, presence: true
  validates :balcony, :corner_table, inclusion: { in: [true, false] }
end
