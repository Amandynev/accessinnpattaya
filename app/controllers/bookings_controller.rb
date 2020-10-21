class BookingsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    p room_available
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to rooms_path
    else
      render "rooms/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :user_id)
  end

  def room_available
    category = @room.category
    rooms = Room.where(category: category)
    @bookings = Booking.where(room: rooms)
  end
end
