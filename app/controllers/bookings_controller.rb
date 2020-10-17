class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @room = BikeOffer.find(params[:bike_offer_id])

    @booking.bike_offer =  @bike_offer
    @booking.user = current_user

    if @booking.save
      redirect_to all_my_bookings_path
    else
      render bike_offer(@bike_offer)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :user_id)
  end
end
