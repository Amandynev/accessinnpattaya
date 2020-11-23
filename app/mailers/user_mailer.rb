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
    @user = params[:user]

    mail to: @user.email, subject: 'Reservation confirmed'
  end
end