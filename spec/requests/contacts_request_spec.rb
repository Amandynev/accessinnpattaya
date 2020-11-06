require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  let(:contact) { Contact.new(name: Faker::FunnyName.name, email: Faker::Internet.email, message: Faker::Lorem.paragraph, nickname: Faker::FunnyName.name) }

  it 'Send an e-mail when valid data' do
    expect { contact.deliver }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it 'Do not send an e-mail with invalid data' do
    contact.email = "max@lewagon"
    expect(contact).not_to be_valid
  end
end
