class BookingsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @booking = Booking.new
    if room = room_available
      @booking = Booking.new(booking_params)
      @booking.room = room
      @booking.user = current_user
      if @booking.save
        redirect_to rooms_path
      else
        render "rooms/show"
      end
    else
      render "rooms/show"
    end
  end

  def allmybookings
    @bookings = Booking.where("user_id = ? AND state = ?", current_user, "pending")
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :user_id, :room_id, :state)
  end

  def room_available
    category = @room.category
    rooms = Room.where(category: category)
    rooms.each do |room|
      availabilty = true
      room.bookings.each do |booking|
        date_range = booking.start_at..booking.end_at
        start_date = Date.new(params[:booking]["start_at(1i)"].to_i, params[:booking]["start_at(2i)"].to_i, params[:booking]["start_at(3i)"].to_i)
        end_date = Date.new(params[:booking]["end_at(1i)"].to_i, params[:booking]["end_at(2i)"].to_i, params[:booking]["end_at(3i)"].to_i)
        availabilty = false if date_range.include?(start_date) || date_range.include?(end_date) || (start_date < booking.start_at && end_date > booking.end_at)
      end
      return room if availabilty
    end
    false
  end
end
