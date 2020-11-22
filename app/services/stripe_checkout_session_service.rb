class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
    order.bookings.each do |booking|
      booking.update(state: 'paid')
    end
    mail = UserMailer.with(user: order.user).reservation
    mail.deliver_later
  end
end
