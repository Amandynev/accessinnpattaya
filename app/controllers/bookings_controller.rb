class BookingsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @booking = Booking.new
    if (rooms = room_available)
      rooms.each do |room|
        @booking = Booking.new(booking_params)
        @booking.room = room
        @booking.user = current_user
        if @booking.save
          # ReservationJob.set(wait: 30.minutes).perform_later(@booking.id)
          @saving = true
        else
          @saving = false
        end
      end
      if @saving
        redirect_to room_path(@room), booked: 'ok'
      else
        render "rooms/show"
      end
    else
      redirect_to room_path(@room), not_booked: 'ok'
    end
  end

  def allmybookings
    @bookings = Booking.includes(room: :category).user_bookings(current_user)
    @hash_bookings = Hash.new { |hash, key| hash[key] = { number: 0, room: nil, nigths: 0, price: 0, start_at: nil, end_at: nil } }
    @bookings.each do |booking|
      @hash_bookings[booking.room.category.name][:number] += 1
      @hash_bookings[booking.room.category.name][:nigths] += (booking.end_at - booking.start_at).to_i
      @hash_bookings[booking.room.category.name][:price] += booking.price / 100
      @hash_bookings[booking.room.category.name][:room] = booking.room if @hash_bookings[booking.room.category.name][:room].nil?
      @hash_bookings[booking.room.category.name][:start_at] = booking.start_at if @hash_bookings[booking.room.category.name][:start_at].nil?
      @hash_bookings[booking.room.category.name][:end_at] = booking.end_at if @hash_bookings[booking.room.category.name][:end_at].nil?
    end
  end

  def destroy_bookings
    category = Category.find(params[:category_id])
    bookings = Booking.user_bookings_category(current_user, category)
    bookings.each(&:destroy)
    redirect_to allmybookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :user_id, :room_id)
  end

  def room_available
    rooms_ok = []
    category = @room.category
    rooms = Room.includes(:bookings).where(category: category)
    rooms.each do |room|
      availability = true
      rooms_ok << room if room.bookings.empty?
      room.bookings.each do |booking|
        next if booking.end_at < Date.today

        booking_range = booking.start_at..booking.end_at
        start_date = params[:booking][:start_at] == "" ? Date.today : Date.parse(params[:booking][:start_at])
        end_date = params[:booking][:end_at] == "" ? Date.today : Date.parse(params[:booking][:end_at])
        registered_booking_range = start_date..end_date
        availability = false if booking_range.overlaps?(registered_booking_range)
        rooms_ok << room if availability
      end
      return rooms_ok if rooms_ok.size == params[:booking][:number].to_i
    end
    false
  end
end
