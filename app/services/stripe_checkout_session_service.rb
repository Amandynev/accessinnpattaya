class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
    bookings = Booking.where("user_id = ? AND state = ? AND start_at >= ?", order.user, "pending", Date.today)
    bookings.each do |booking|
      booking.update(state: 'paid')
    end
    mail = UserMailer.with(user: order.user).reservation
    mail.deliver_later
  end
end