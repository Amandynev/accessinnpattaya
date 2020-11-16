require 'rails_helper'

RSpec.feature "Bookings", type: :feature do
  let!(:user) { create(:user) }

  describe 'Views' do
    it 'Visit allmybookings page' do
      Booking.destroy_all
      login_as user
      create(:booking, user: user)
      visit(allmybookings_path)
      expect(page).to have_current_path(allmybookings_path)
      expect(page).to have_css('.card-booking')
    end
  end
end
