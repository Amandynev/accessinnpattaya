class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user]
    mail to: @user.email, subject: 'Welcome to AccessInn Pattaya World'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reservation.subject
  #
  def reservation
    @order = params[:order]

    mail to: @order.user.email, subject: 'Reservation confirmed', from: 'reservations@accessinnpattaya.com', track_opens: 'true', message_stream: 'outbound'
  end

  def contact
    @email = params[:email]
    @message = params[:message]
    @name = params[:name]
    @phone = params[:phone]
    mail to: 'reservations@accessinnpattaya.com', subject: 'Contact request from the website', from: 'reservations@accessinnpattaya.com', track_opens: 'true', message_stream: 'outbound'
  end
end
