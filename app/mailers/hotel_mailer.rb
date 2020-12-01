class HotelMailer < ApplicationMailer
  def contact
    @email = params[:email]
    @message = params[:message]
    @name = params[:name]
    @phone = params[:phone]
    mail to: 'reservations@accessinnpattaya.com', subject: 'Contact request from the website', from: 'reservations@accessinnpattaya.com', track_opens: 'true', message_stream: 'outbound'
  end

  def reservation
    @order = params[:order]

    mail to: 'reservations@accessinnpattaya.com', subject: 'Reservation confirmed', from: 'reservations@accessinnpattaya.com', track_opens: 'true', message_stream: 'outbound'
  end
end
