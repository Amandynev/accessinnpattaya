class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_locale
  add_flash_types :sent, :booked, :not_booked

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
end
