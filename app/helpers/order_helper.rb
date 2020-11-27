module OrderHelper
  def refacto_order(bookings)
    hash_bookings = Hash.new { |hash, key| hash[key] = { number: 0, room: nil, nigths: 0, price: 0, start_at: nil, end_at: nil } }
    bookings.each do |booking|
      hash_bookings[booking.room.category.name][:number] += 1
      hash_bookings[booking.room.category.name][:nigths] += (booking.end_at - booking.start_at).to_i
      hash_bookings[booking.room.category.name][:price] += booking.price / 100
      hash_bookings[booking.room.category.name][:room] = booking.room if hash_bookings[booking.room.category.name][:room].nil?
      hash_bookings[booking.room.category.name][:start_at] = booking.start_at if hash_bookings[booking.room.category.name][:start_at].nil?
      hash_bookings[booking.room.category.name][:end_at] = booking.end_at if hash_bookings[booking.room.category.name][:end_at].nil?
    end
    hash_bookings
  end
end
