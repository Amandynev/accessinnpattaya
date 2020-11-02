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
    respond_to do |format|
      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Page.new
        format.html { render 'contact' }
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        format.html { render 'contact' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end
end
