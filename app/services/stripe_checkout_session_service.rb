class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
    bookings = Booking.where("user_id = ? AND state = ?", order.user, "pending")
    bookings.each do |booking|
      booking.update(state: 'paid')
    end
  end
end