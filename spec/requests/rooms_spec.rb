require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  let!(:locale) { nil }
  let!(:accessinn) { Category.find_by(name: "The Access inn") }
  let!(:rooms) { Room.where(category: accessinn) }
  Booking.destroy_all

  describe "As a visitor" do
    it 'Should access the rooms index' do
      get rooms_path
      expect(response).to have_http_status '200'
    end

    it 'Should access a room show' do
      get room_path(locale, rooms.first)
      expect(response).to have_http_status '200'
    end

    it 'Should be able to check availability' do
      build(:booking, room: rooms.first)
      build(:booking, room: rooms.second)
      get searchedrooms_path params: { start_at: [Date.today.to_s], end_at: [(Date.today + 2).to_s] }
      expect(response).to have_http_status '200'
    end
  end
end
