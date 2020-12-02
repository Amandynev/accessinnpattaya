class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
    order.bookings.each do |booking|
      booking.update(state: 'paid')
    end
    mail_client = UserMailer.with(order: order).reservation
    mail_client.deliver_later
    mail_hotel = HotelMailer.with(order: order).reservation
    mail_hotel.deliver_later
  end
end
