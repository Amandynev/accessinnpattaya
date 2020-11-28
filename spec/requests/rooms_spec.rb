require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  let!(:locale) { nil }
  let!(:room) {Category.all.sample.rooms.first}

  describe "As a visitor" do
    it 'Should access the rooms index' do
      get rooms_path
      expect(response).to have_http_status '200'
    end

    it 'Should access a room show' do
      get room_path(locale, room)
      expect(response).to have_http_status '200'
    end

    # it 'Should be able to check availability' do

    # end
  end
end
