class BookingsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    if room_available
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      if @booking.save
        RoomBooking.create(booking: @booking, room: @room)
        redirect_to rooms_path
      else
        render "rooms/show"
      end
    else
      render "rooms/show"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :user_id)
  end

  def room_available
    category = @room.category
    rooms = Room.where(category: category)
    room_booking = RoomBooking.where(room: rooms)
    @bookings = Booking.where(room_bookings: room_booking)
    rooms.each do |room|
      room.room_bookings.each do |room_booking_e|
        date_range = room_booking_e.booking.start_at...room_booking_e.booking.end_at
        start_date = Date.new(params[:booking]["start_at(1i)"].to_i, params[:booking]["start_at(2i)"].to_i, params[:booking]["start_at(3i)"].to_i)
        end_date = Date.new(params[:booking]["end_at(1i)"].to_i, params[:booking]["end_at(2i)"].to_i, params[:booking]["end_at(3i)"].to_i)
        return false if date_range.include?(start_date) || date_range.include?(end_date)
      end
    end
    true
  end
end
