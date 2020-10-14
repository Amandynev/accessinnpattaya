# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts"destroy data ..."

Room.destroy_all
Category.destroy_all
Hotel.destroy_all

puts "create hotel ..."

Hotel.create!(name:"Nom de ton hotel", address: "2 Avenue des Saules, 59160 Lille")

puts "create rooms"
puts "create categories"

  accessinn = Category.create!(
  name: "The Access inn",
  description: "Discover the fantastic refreshing and unique Access inn room. Located on the 2nd and 3rd floor of the hotel. Panoramic Lift access. Music system in room, special LED design and a spacious room with a sofa corner and a balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 800,
  room_size: 29,
)

  superior = Category.create!(
  name: "Superior double",
  description: "Discover the fantastic refreshing superior rooms. Located on the 3 floors of the hotel. Panoramic Lift access and Music system in room as a basement of your personal relaxation during your stay.",
  price: 490,
  room_size: 18,
)

  deluxe = Category.create!(
  name: "Deluxe double",
  description: "Discover the fantastic refreshing deluxe rooms. Located on the 3 floors of the hotel. Panoramic Lift access. Music system in room and a private balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 550,
  room_size: 19,
)

  premium = Category.create!(
  name: "Premium double",
  description: "Discover the fantastic refreshing premium rooms. Located on the 3 floors of the hotel. Panoramic Lift access. Music system in room, special LED design and a private balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 650,
  room_size: 25,
)

  suite = Category.create!(
  name: "Suite double",
  description: "Discover the fantastic refreshing suite rooms. Located on the 1st floor of the hotel. Panoramic Lift access. Music system in room, special LED design and a spacious room with a sofa corner and a private balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 750,
  room_size: 27,
)


