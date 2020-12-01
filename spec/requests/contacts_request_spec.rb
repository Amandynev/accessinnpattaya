require 'rails_helper'

RSpec.describe "Pages", type: :request do
  let(:page) { Page.new(name: Faker::FunnyName.name, email: Faker::Internet.email, message: Faker::Lorem.paragraph, nickname: Faker::FunnyName.name) }

  it 'Send an e-mail when valid data' do
    mail = HotelMailer.with(name: page.name, phone: page.phone, email: page.email, message: page.message).contact
    expect { mail.deliver }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it 'Do not send an e-mail with invalid data' do
    page.email = "max@lewagon"
    expect(page).not_to be_valid
  end
end
