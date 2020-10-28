class StripeCheckoutSessionService
  def call(event)
    p "==================DEBUT===================="
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
    p "======================MILIEU======================="
    bookings = Booking.where("user_id = ? AND state = ?", order.user, "pending")
    p bookings
    bookings.each do |booking|
      p "=================UPDATE==================="
      p booking
      booking.update(state: 'paid')
      p booking
    end
    p "======================FIN======================="
  end
end