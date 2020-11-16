# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroy data ..."

Order.destroy_all
Booking.destroy_all
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
  description: "Discover the fantastic refreshing and unique Access inn room. Located on the 2nd and 3rd floor of the hotel. Panoramic Lift access. Music system in room, special LED design and a spacious room with a sofa corner and a balcony with his PVC sliding window as a basement of your personal relaxation during your stay.
  Extra bed available (extra cost)",
  price: 800,
  room_size: 29,
  bed_size: "King size",
  balcony: true,
  corner_table: true,
  smoking: true,

)
suite = Category.create!(
  name: "Suite double",
  description: "Discover the fantastic refreshing suite rooms. Located on the 1st floor of the hotel. Panoramic Lift access. Music system in room, special LED design and a spacious room with a sofa corner and a private balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 750,
  room_size: 27,
  bed_size: "King size",
  balcony: false,
  corner_table: true,
  smoking: false,
)

premium = Category.create!(
  name: "Premium double",
  description: "Discover the fantastic premium rooms. Located on the 3rd floors of the hotel. Panoramic Lift access. Music system in room, special LED design and a private balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 650,
  room_size: 25,
  bed_size: "King size",
  balcony: true,
  corner_table: true,
  smoking: true,
)

deluxe = Category.create!(
  name: "Deluxe double",
  description: "Discover the fantastic refreshing deluxe rooms. Located on the 3rd floors of the hotel. Panoramic Lift access. Music system in room and a private balcony with his PVC sliding window as a basement of your personal relaxation during your stay.",
  price: 550,
  room_size: 19,
  bed_size: "King size",
  balcony: true,
  corner_table: false,
  smoking: true,
)

superior = Category.create!(
  name: "Superior double",
  description: "Discover the fantastic refreshing superior rooms. Located on the 3rd floors of the hotel. Panoramic Lift access and Music system in room as a basement of your personal relaxation during your stay.",
  price: 490,
  room_size: 18,
  bed_size: "Queen size",
  balcony: false,
  corner_table: false,
  smoking: false,
)

puts "Traduction ..."

accessinn.attributes = {
  name: "The Access inn",
  description: "Découvrez notre fantastique et unique chambre Access inn. Située aux 2ème et 3ème étages de l'hôtel. Accès par ascenceur panoramique. Chaine HI-FI et lumières new desing dans une chambre spacieuse avec coin sofa et balcon équipé d'une baie vitrée coulissante qui saura vous fournir un véritable coin relaxation pendant votre séjour.",
  bed_size: "King size",
  locale: :fr
}
accessinn.save

suite.attributes = {
  name: "Suite double",
  description: "Découvrez notre fantastique Suite. Située au 1er étage de l'hôtel. Accès par ascenceur panoramique. Chaine HI-FI et lumières new desing dans une chambre spacieuse avec coin sofa et balcon équipé d'une baie vitrée coulissante qui saura vous fournir un véritable coin relaxation pendant votre séjour.",
  bed_size: "King size",
  locale: :fr
}
suite.save

premium.attributes = {
  name: "Premium double",
  description: "Découvrez notre fantastique chambre premium. Située au 3ème étage de l'hôtel. Accès par ascenceur panoramique. Chaine HI-FI, lumières new desing et balcon équipé d'une baie vitrée coulissante qui saura vous fournir un véritable coin relaxation pendant votre séjour.",
  bed_size: "King size",
  locale: :fr
}
premium.save

deluxe.attributes = {
  name: "Deluxe double",
  description: "Découvrez notre fantastique chambre deluxe. Située au 3ème étage de l'hôtel. Accès par ascenceur panoramique. Chaine HI-FI et balcon équipé d'une baie vitrée coulissante qui saura vous fournir un véritable coin relaxation pendant votre séjour.",
  bed_size: "King size",
  locale: :fr
}
deluxe.save

superior.attributes = {
  name: "Superior double",
  description: "Découvrez notre fantastique chambre supérieure. Située au 3ème étage de l'hôtel. Accès par ascenceur panoramique et Chaine HI-FI qui saura répondre à vos attentes pendant votre séjour.",
  bed_size: "King size",
  locale: :fr
}
superior.save

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
