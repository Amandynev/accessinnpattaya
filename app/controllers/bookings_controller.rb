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
        else
          render "rooms/show"
          return false
        end
      end
      redirect_to rooms_path
    else
      @modal = true
      render "rooms/show"
    end
  end

  def allmybookings
    @bookings = Booking.user_bookings(current_user)
    @hash_bookings = Hash.new { |hash, key| hash[key] = { number: 0, room: nil, nigths: 0, price: 0 } }
    @bookings.each do |booking|
      @hash_bookings[booking.room.category.name][:number] += 1
      @hash_bookings[booking.room.category.name][:nigths] += (booking.end_at - booking.start_at).to_i
      @hash_bookings[booking.room.category.name][:price] += booking.price / 100
      @hash_bookings[booking.room.category.name][:room] = booking.room if @hash_bookings[booking.room.category.name][:room].nil?
    end
    @amount = @bookings.map(&:price).sum
  end

  def destroy_bookings
    category = Category.find(params[:category_id])
    bookings = Booking.where(room: category.rooms, user: current_user)
    bookings.each(&:destroy)
    redirect_to allmybookings_path
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
        start_date = params[:booking][:start_at] == "" ? Date.today : Date.parse(params[:booking][:start_at])
        end_date = params[:booking][:end_at] == "" ? Date.today : Date.parse(params[:booking][:end_at])
        availability = false if date_range.include?(start_date) || date_range.include?(end_date) || (start_date < booking.start_at && end_date > booking.end_at)
        rooms_ok << room if availability
      end
      return rooms_ok if rooms_ok.size == params[:booking][:number].to_i
    end
    false
  end
end
