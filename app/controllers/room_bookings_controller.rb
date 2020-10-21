class RoomBookingsController < ApplicationController
  def create
    RoomBooking.new
  end

  private
  def booking_params
    params.require(:room_booking).permit(:room_id, :booking_id)
  end
end
