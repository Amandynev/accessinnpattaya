class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @categories = Category.all
  end

  def show
    @room = Room.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :price, :room_size, :bed_size, :balcony, :corner_table)
  end
end
