class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :restaurant, :event, :contact]

  def home
    @categories = Category.all
    @booking = Booking.new

  end

  def restaurant
  end

  def event
  end

  def contact
     @markers =
      {
        lat: Hotel.first.latitude,
        lng: Hotel.first.longitude
      }

  end


end
