FactoryBot.define do
  factory :category do
    name { "Deluxe double" }
    description { "Discover the fantastic refreshing deluxe rooms. Located on the 3rd floors of the hotel. Panoramic Lift access. Music system in room and a private balcony with his PVC sliding window as a basement of your personal relaxation during your stay." }
    price { 550 }
    room_size { 19 }
    bed_size { "King size" }
    balcony { true }
    corner_table { false }
  end
end
