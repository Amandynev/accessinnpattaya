# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts"destroy rooms"
puts"destroy categories"
Room.destroy_all
Category.destroy_all
puts "create rooms"
puts "create categories"

  accessinn = Category.create!(
  name: "The Access inn",
  description: "The Access inn room is available in blue, purple or green.",
  price: 800,
  room_size: 29,
  balcony: true,
  corner_table: true
)

  superior = Category.create!(
  name: "Superior double",
  description: "The superior room is located on the 3rd floor",
  price: 490,
  room_size: 18,
  balcony: false,
  corner_table: false
)

  deluxe = Category.create!(
  name: "Deluxe double",
  description: "The deluxe double room is available in yellow and red.",
  price: 550,
  room_size: 19,
  balcony: true,
  corner_table: false
)

  premium = Category.create!(
  name: "Premium double",
  description: "The premium double room is available in red, orange and blue.",
  price: 650,
  room_size: 25,
  balcony: true,
  corner_table: true
)

  suite = Category.create!(
  name: "Suite double",
  description: "The suite double room is available in purple.",
  price: 650,
  room_size: 27,
  balcony: true,
  corner_table: true
)


