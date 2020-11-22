class OrdersController < ApplicationController
  def create
    bookings = Booking.includes(:room).where("user_id = ? AND state = ?", current_user, "pending")
    amount = bookings.map(&:price).sum
    order  = Order.create!(amount: amount, state: 'pending', user: current_user)
    bookings.each do |booking|
      OrderBooking.create(order: order, booking: booking)
    end

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: order.id,
        amount: amount,
        currency: 'thb',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
