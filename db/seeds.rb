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
User.destroy_all

puts "create users ..."

maxence = User.create!(email: "maxence@lewagon.org", password: "azerty")

puts "create hotel ..."

Hotel.create!(name:"Access inn Pattaya", address: "soi lengkee, Chon Buri 20150, pattaya, thailand")

puts "create categories..."

accessinn = Category.create!(
  name: "The Access inn",
  description: "Discover the fantastic refreshing and unique Access inn room. Located on the 2nd and 3rd floor of the hotel. Panoramic Lift access. Music system in room, special LED design and a spacious room with a sofa corner and a balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 800,
  room_size: 29,
  bed_size: "King size",
  balcony: true,
  corner_table: true
)
suite = Category.create!(
  name: "Suite double",
  description: "Discover the fantastic refreshing suite rooms. Located on the 1st floor of the hotel. Panoramic Lift access. Music system in room, special LED design and a spacious room with a sofa corner and a private balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 750,
  room_size: 27,
  bed_size: "King size",
  balcony: false,
  corner_table: true
)

premium = Category.create!(
  name: "Premium double",
  description: "Discover the fantastic premium rooms. Located on the 3rd floors of the hotel. Panoramic Lift access. Music system in room, special LED design and a private balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 650,
  room_size: 25,
  bed_size: "King size",
  balcony: true,
  corner_table: true
)

deluxe = Category.create!(
  name: "Deluxe double",
  description: "Discover the fantastic refreshing deluxe rooms. Located on the 3rd floors of the hotel. Panoramic Lift access. Music system in room and a private balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 550,
  room_size: 19,
  bed_size: "King size",
  balcony: true,
  corner_table: false
)
superior = Category.create!(
  name: "Superior double",
  description: "Discover the fantastic refreshing superior rooms. Located on the 3rd floors of the hotel. Panoramic Lift access and Music system in room as a basement of your personal relaxation during your stay.",
  price: 490,
  room_size: 18,
  bed_size: "Queen size",
  balcony: false,
  corner_table: false
)



puts "create rooms..."

5.times do
  Room.create!(
    category: accessinn,
    photo: "accessinn.jpg"
    )
end

3.times do
  Room.create!(
    category: superior,
    photo: "superior.jpg"
    )
end

6.times do
  Room.create!(
    category: deluxe,
    photo: "deluxe.jpg"
    )
end

11.times do
  Room.create!(
    category: premium,
    photo: "premium.jpg"
    )
end

2.times do
  Room.create!(
    category: suite,
    photo: "suite.jpg"
    )
end


puts "Finished !"
