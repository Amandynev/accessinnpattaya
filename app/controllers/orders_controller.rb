class OrdersController < ApplicationController
  def create
    bookings = Booking.includes(:room).where("user_id = ? AND state = ?", current_user, "pending")
    amount = bookings.map(&:price).sum / 100
    order_30_minutes_before = Order.where("state = ? AND user_id = ?", "pending", current_user)
    order_30_minutes_before.destroy_all unless order_30_minutes_before.empty?
    order = Order.create!(amount: amount, state: 'pending', user: current_user)
    bookings.each do |booking|
      OrderBooking.create(order: order, booking: booking)
    end
    OrderJob.set(wait: 30.minutes).perform_later(order.id)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: order.id,
        amount: order.amount_cents,
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

  def allmyreservations
    @orders = Order.includes(:order_bookings, bookings: { room: { category: :translations } }).where(user: current_user, state: %w[paid pending]).order(created_at: :asc)
  end
end
