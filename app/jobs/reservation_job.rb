class ReservationJob < ApplicationJob
  queue_as :default

  def perform(id)
    if Booking.count.positive?
      booking = Booking.find(id)
      booking.update(state: "canceled") if booking.state == "pending"
    end
  end
end
