class Page < MailForm::Base

  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone
  attribute :message, validate: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: "Contact Form Inquiry",
      to: "booking.accessinnpattaya@gmail.com",
      from: %("#{name}" <#{email}>)
    }
  end
end
