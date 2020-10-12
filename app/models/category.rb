class Category < ApplicationRecord
  has_many :rooms
  validates :name, :description, :price, :room_size, :bed_size, :balcony, :coner_table, presence: true
end
