class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :user_id)
  end
end
