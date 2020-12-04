require 'paypal-checkout-sdk'

class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :paypal_init, except: :index

  def index
  end

  # STRIPE
  def create
    set_order_creation

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @order.id,
        amount: @order.amount_cents,
        currency: 'thb',
        quantity: 1
      }],
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

  # PAYPAL
  def create_order
    set_order_creation

    price = @order.amount
    request = PayPalCheckoutSdk::Orders::OrdersCreateRequest.new
    request.request_body({  intent: 'CAPTURE',
                            purchase_units: [
                              {
                                amount: {
                                  currency_code: 'THB',
                                  value: price
                                }
                              }
                            ] })
    begin
      response = @client.execute(request)
      @order.price = price.to_i
      @order.token = response.result.id

      @order.amount_cents = price.to_i
      @order.state = "pending"

      if @order.save
        render json: { token: response.result.id }, status: :ok
        # else
        # redirect_to order_url(order)
      end
    rescue PayPalHttp::HttpError => ioe
    end
  end

  def capture_order
    request = PayPalCheckoutSdk::Orders::OrdersCaptureRequest.new params[:order_id]
    begin
      response = @client.execute request
      order = Order.find_by token: params[:order_id]
      if response.result.status == 'COMPLETED'
        order.state = "paid"
        order.bookings.each do |booking|
          booking.update(state: 'paid')
        end
      end
      if order.save
        mail = UserMailer.with(order: order).reservation
        mail.deliver_later
        mail_hotel = HotelMailer.with(order: order).reservation
        mail_hotel.deliver_later
        return render json: {status: response.result.status, redirect_url: order_url(order)}, :status => :ok

      end
    rescue PayPalHttp::HttpError => ioe
      # HANDLE THE ERROR
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def allmyreservations
    @orders = Order.includes(:order_bookings, bookings: { room: { category: :translations } }).where(user: current_user, state: %w[paid pending]).order(created_at: :asc)
  end

  def paypal_init
    client_id = ENV['PAYPAL_CLIENT_ID']
    client_secret = ENV['PAYPAL_CLIENT_SECRET']
    environment = PayPal::SandboxEnvironment.new client_id, client_secret
    @client = PayPal::PayPalHttpClient.new environment
  end

  private

  def set_order_creation
    bookings = Booking.includes(:room).where("user_id = ? AND state = ?", current_user, "pending")
    amount = bookings.map(&:price).sum / 100
    order_30_minutes_before = Order.where("state = ? AND user_id = ?", "pending", current_user)
    order_30_minutes_before.destroy_all unless order_30_minutes_before.empty?
    @order = Order.create!(amount: amount, state: 'pending', user: current_user)
    bookings.each do |booking|
      OrderBooking.create(order: @order, booking: booking)
    end
    OrderJob.set(wait: 30.minutes).perform_later(@order.id)
  end
end
