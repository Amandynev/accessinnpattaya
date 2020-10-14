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
puts "create categories..."

accessinn = Category.create!(
  name: "The Access inn",
  description: "Discover the fantastic refreshing and unique Access inn room. Located on the 2nd and 3rd floor of the hotel. Panoramic Lift access. Music system in room, special LED design and a spacious room with a sofa corner and a balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 800,
  room_size: 29,
  bed_size: 1,
  balcony: true,
  corner_table: true
)

superior = Category.create!(
  name: "Superior double",
  description: "Discover the fantastic refreshing superior rooms. Located on the 3 floors of the hotel. Panoramic Lift access and Music system in room as a basement of your personal relaxation during your stay.",
  price: 490,
  room_size: 18,
  bed_size: 1,
  balcony: false,
  corner_table: false
)

deluxe = Category.create!(
  name: "Deluxe double",
  description: "Discover the fantastic refreshing deluxe rooms. Located on the 3 floors of the hotel. Panoramic Lift access. Music system in room and a private balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 550,
  room_size: 19,
  bed_size: 1,
  balcony: true,
  corner_table: false
)

premium = Category.create!(
  name: "Premium double",
  description: "Discover the fantastic refreshing premium rooms. Located on the 3 floors of the hotel. Panoramic Lift access. Music system in room, special LED design and a private balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 650,
  room_size: 25,
  bed_size: 1,
  balcony: true,
  corner_table: true
)

suite = Category.create!(
  name: "Suite double",
  description: "Discover the fantastic refreshing suite rooms. Located on the 1st floor of the hotel. Panoramic Lift access. Music system in room, special LED design and a spacious room with a sofa corner and a private balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 750,
  room_size: 27,
  bed_size: 1,
  balcony: true,
  corner_table: true
)

puts "create rooms..."

6.times do
  Room.create!(category: accessinn)
end

1.times do
  Room.create!(category: superior)
end

1.times do
  Room.create!(category: deluxe)
end

1.times do
  Room.create!(category: premium)
end

1.times do
  Room.create!(category: suite)
end


puts "Finished !"
