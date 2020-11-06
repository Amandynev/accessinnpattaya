class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :restaurant, :event, :contact, :new, :create]

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

    @contact = Page.new(params[:page])
  end

  def create
    @contact = Page.new(params[:page])
    @contact.request = request

      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Page.new
        @modalsuccess = true
        redirect_to contact_path
      else
        render 'contact'
      end
  end
end
