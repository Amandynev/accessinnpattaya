class BookingsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @booking = Booking.new
    if (rooms = room_available)
      rooms.each do |room|
        @booking = Booking.new(booking_params)
        @booking.room = room
        @booking.user = current_user
        @booking.save
        # ReservationJob.set(wait: 30.minutes).perform_later(@booking.id)
      end
      redirect_to rooms_path
    else
      render "rooms/show"
    end
  end

  def allmybookings
    @bookings = Booking.where("user_id = ? AND state = ?", current_user, "pending")
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :state)
  end

  def room_available
    rooms_ok = []
    category = @room.category
    rooms = Room.where(category: category)
    rooms.each do |room|
      availability = true
      rooms_ok << room if room.bookings.empty?
      room.bookings.each do |booking|
        next if booking.end_at < Date.today

        date_range = booking.start_at..booking.end_at
        start_date = Rails.env.test? ? Date.parse(params[:booking][:start_at]) : Date.new(params[:booking]["start_at(1i)"].to_i, params[:booking]["start_at(2i)"].to_i, params[:booking]["start_at(3i)"].to_i)
        end_date = Rails.env.test? ? Date.parse(params[:booking][:end_at]) : Date.new(params[:booking]["end_at(1i)"].to_i, params[:booking]["end_at(2i)"].to_i, params[:booking]["end_at(3i)"].to_i)
        availability = false if date_range.include?(start_date) || date_range.include?(end_date) || (start_date < booking.start_at && end_date > booking.end_at)
        rooms_ok << room if availability
      end
      return rooms_ok if rooms_ok.size == params[:booking][:number].to_i
    end
    false
  end
end
