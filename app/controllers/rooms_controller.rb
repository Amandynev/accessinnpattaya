class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_room, only: %i[show]

  def index
    @categories = Category.all
  end

  def show
    @booking = Booking.new
  end

  private

  def set_room
    category = Category.find(params[:id])
    @room = Room.where(category: category).first
  end
end
