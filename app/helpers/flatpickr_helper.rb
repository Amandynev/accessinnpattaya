module FlatpickrHelper
  def dates_flat_pickr(rooms)
    hash_availability = Hash.new(0)
    @bookings_dates = []
    bookings = Booking.where(state: %w[pending paid], room: rooms).where("end_at >= ?", Date.today)
    bookings.map { |booking| (booking.start_at..booking.end_at) }.each do |range_date|
      range_date.each do |date|
        hash_availability[date.to_s] += 1
      end
    end
    hash_availability.each do |date, value|
      @bookings_dates << { from: date, to: date } if value == rooms.size
    end
    @bookings_dates
  end
end
