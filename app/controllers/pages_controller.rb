class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home restaurant event contact new create]

  def home
    @categories = Category.includes(:translations).all
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
    if @contact.valid?
      mail = HotelMailer.with(name: @contact.name, phone: @contact.phone, email: @contact.email, message: @contact.message).contact
      if mail.deliver_later
        redirect_to contact_path, sent: "ok"
      else
        render 'contact'
      end
    else
      render 'contact'
    end
  end

  private

  def booking_params
    params.require(:page).permit(:name, :email, :phone, :message)
  end
end
