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
  end

  def searchedrooms
    @categories = Category.all
    hash_unavailability = Hash.new(0)
    bookings = Booking.includes(room: :category).where("end_at >= ?", Date.today)
    bookings.each do |booking|
      booking_range = booking.start_at..booking.end_at
      start_date = params[:start_at] == [""] ? Date.today : Date.parse(params[:start_at].first)
      end_date = params[:end_at] == [""] ? Date.today : Date.parse(params[:end_at].first)
      registered_booking_range = start_date..end_date
      hash_unavailability[booking.room.category.name] += 1 if booking_range.overlaps?(registered_booking_range) && %w[pending paid].include?(booking.state)
    end
    @hashsearched = HASH_AVAILABILITY.merge(hash_unavailability) { |_k, newval, oldval| newval - oldval }
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end
end
