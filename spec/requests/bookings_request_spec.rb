require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  before do
    @user = create(:user)
    @suite = Category.where(name: "Suite double")
    @room_not_available = Room.where(category: @suite).sample
    @room_available = Room.first
  end

  describe 'As a Logged User' do
    it 'Should not be able to book a room if no more left' do
      create(:booking, room: Room.where(category_id: @suite).first)
      create(:booking, room: Room.where(category_id: @suite).second)
      login_as @user
      booking_params = attributes_for(:booking, room: @room_not_available, number: 1)
      expect { post room_bookings_path(@room_not_available.category.rooms.first), params: { booking: booking_params } }.not_to change(Booking, :count)
    end

    it 'Should be able to book 2 rooms if still availables' do
      login_as @user
      booking_params = attributes_for(:booking, room: @room_available, number: 2)
      expect { post room_bookings_path(@room_available.category.rooms.first), params: { booking: booking_params } }.to change(Booking, :count).by(2)
    end

    it 'Should not be able to book 4 rooms if not enough availables' do
      login_as @user
      create(:booking, room: Room.where(category_id: @room_available.category).first)
      create(:booking, room: Room.where(category_id: @room_available.category).second)

      booking_params = attributes_for(:booking, room: @room_available, number: 4)
      expect { post room_bookings_path(@room_available.category.rooms.first), params: { booking: booking_params } }.not_to change(Booking, :count)
    end
  end
end
