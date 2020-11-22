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
    @contact.request = request
    if @contact.deliver
      @contact = Page.new
      @modalsuccess = true
      redirect_to contact_path
    else
      render 'contact'
    end
  end
end
