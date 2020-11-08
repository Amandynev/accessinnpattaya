require 'rails_helper'

RSpec.feature 'Bookings', type: :feature, js: true do
  describe 'Simple views' do
    let(:room) { Category.all.sample.rooms.first }

    it 'Visit a room page' do
      visit(room_path(room))
      expect(page).to have_current_path(room_path(room))
    end
  end
end
