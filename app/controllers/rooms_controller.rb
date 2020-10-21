class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_room, only: %i[show]

  def index
    @categories = Category.all
  end

  def show
    @room = Room.find(params[:id])
    @booking = Booking.new
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end
end
