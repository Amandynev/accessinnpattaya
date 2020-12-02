require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  let!(:locale) { nil }

  describe 'As a Visitor' do
    it 'Should access the home page' do
      get root_path
      expect(response).to have_http_status '200'
    end

    it 'Should not have access to the allmybookings page' do
      get allmybookings_path
      expect(response).to have_http_status '302'
    end

    it 'Should not be able to create a booking' do
      booking_params = attributes_for(:booking, number: 1)
      expect { post room_bookings_path(locale, booking_params[:room].id), params: { booking: booking_params } }.not_to change(Booking, :count)
      expect(response).to have_http_status '302'
    end
  end

  let!(:locale) { nil }

  describe 'As a Logged User' do
    let!(:user) { create(:user) }
    let!(:suite) { Category.where(name: "Suite double") }
    let!(:accessinn) { Category.where(name: "The Access inn") }
    let!(:room_not_available) { Room.where(category: suite).sample }
    let!(:room_available) { Room.find_by(category: accessinn) }
    Booking.destroy_all

    it 'Should not be able to book a room if no more left' do
      create(:booking, room: Room.where(category_id: suite).first)
      create(:booking, room: Room.where(category_id: suite).second)
      login_as user
      booking_params = attributes_for(:booking, room: room_not_available, number: 1)
      expect { post room_bookings_path(locale, room_not_available.category.rooms.first), params: { booking: booking_params } }.not_to change(Booking, :count)
    end

    it 'Should be able to book 2 rooms if still availables' do
      login_as user
      booking_params = attributes_for(:booking, room: room_available, number: 2)
      expect { post room_bookings_path(locale, room_available.category.rooms.first), params: { booking: booking_params } }.to change(Booking, :count).by(2)
    end

    it 'Should be able to book 50 times the same room with diferents dates' do
      login_as user
      count = 0
      50.times do
        rand_numb = rand(1..5)
        count += 2
        booking_params = attributes_for(:booking, start_at: Date.today + count, end_at:Date.today + count + 1, room: room_available, number: rand_numb)
        expect { post room_bookings_path(locale, room_available.category.rooms.first), params: { booking: booking_params } }.to change(Booking, :count).by(rand_numb  )
      end
    end

    it 'Should not be able to book 4 rooms if not enough availables' do
      login_as user
      create(:booking, room: Room.where(category_id: room_available.category).first)
      create(:booking, room: Room.where(category_id: room_available.category).second)

      booking_params = attributes_for(:booking, room: room_available, number: 4)
      expect { post room_bookings_path(locale, room_available.category.rooms.first), params: { booking: booking_params } }.not_to change(Booking, :count)
    end

    it 'Should be able to destroy a booking' do
      login_as user
      create(:booking, room: Room.find_by(category_id: room_available.category), user: user)
      expect { delete destroy_bookings_path(locale, room_available.category) }.to change(Booking, :count).by(-1)
    end
  end
end
