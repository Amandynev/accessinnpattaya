class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show searchedrooms]
  before_action :set_room, only: %i[show]

  HASH_AVAILABILITY = {
    "The Access inn" => 5,
    "Suite double" => 2,
    "Premium double" => 11,
    "Deluxe double" => 6,
    "Superior double" => 3
  }

  def index
    @categories = Category.includes(:translations).all
  end

  def show
    @room = Room.find(params[:id])
    @categories = Category.includes(:translations).all.reject { |category| category.name == @room.category.name }
    @booking = Booking.new
    dates_flat_pickr
  end

  def searchedrooms
    @categories = Category.all
    hash_unavailability = Hash.new(0)
    bookings = Booking.includes(room: :category).where("end_at >= ?", Date.today)
    bookings.each do |booking|
      date_range = booking.start_at..booking.end_at
      start_date = params[:start_at] == [""] ? Date.today : Date.parse(params[:start_at].first)
      end_date = params[:end_at] == [""] ? Date.today : Date.parse(params[:end_at].first)
      hash_unavailability[booking.room.category.name] += 1 if (date_range.include?(start_date) || date_range.include?(end_date) || (start_date < booking.start_at && end_date > booking.end_at)) && booking.state == "pending"
    end
    @hashsearched = HASH_AVAILABILITY.merge(hash_unavailability) { |_k, newval, oldval| newval - oldval }
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def dates_flat_pickr
    hash_availability = Hash.new(0)
    @bookings_dates = []
    bookings = Booking.where(state: %w[pending paid], room: Category.first.rooms)
    bookings.map { |booking| (booking.start_at..booking.end_at)}.each do |range_date|
      range_date.each do |date|
        hash_availability[date.to_s] += 1
      end
    end
    hash_availability.each do |date, value|
      @bookings_dates << { from: date, to: date } if value == Category.first.rooms.size
    end
  end
end
