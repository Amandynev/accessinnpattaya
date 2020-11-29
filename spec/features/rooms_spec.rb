require 'rails_helper'

RSpec.feature 'Rooms', type: :feature, js: true do
  let!(:room) { Room.all.sample }
  let!(:next_day) { Date.today.next_day }
  let!(:locale) { nil }
  let!(:accessinn) { Category.find_by(name: "The Access inn") }
  Booking.destroy_all

  describe 'Views' do
    it 'Visit a room page' do
      visit(room_path(locale, room))
      expect(page).to have_current_path(room_path(locale, room))
    end
  end

  describe 'FlatPickr' do
    it 'Room Page should handle a date change' do
      visit(room_path(locale, room))
      fill_in('range_start', with: Date.today.next_month.prev_day.to_s)
      fill_in('range_end', with: next_day.next_month.next_month.to_s)
      fill_in('range_start', with: Date.today.next_month.to_s)
      fill_in('range_end', with: next_day.next_month.next_month.to_s)
      expect(page).to have_css('.flatpickr-month')
      expect(find('#start-month-calendar')).to have_content(Date::ABBR_MONTHNAMES[Date.today.month + 1].to_s)
      expect(find('#end-month-calendar')).to have_content(Date::ABBR_MONTHNAMES[next_day.month + (next_day == 1 ? 2 : 3)].to_s)
      expect(find('#end-day-calendar')).to have_content(next_day.next_month.next_month.day.to_s)
    end
  end

  describe 'Searchedrooms' do
    it 'Search Page should sent correct information' do
      create(:booking, room: accessinn.rooms.first)
      create(:booking, room: accessinn.rooms.second)
      visit(root_path)
      fill_in('range_start', with: Date.today.to_s)
      fill_in('range_end', with: next_day.to_s)
      fill_in('range_start', with: Date.today.to_s)
      fill_in('range_end', with: next_day.to_s)
      click_on(I18n.t('page.home.button-search'))
      expect(page).to have_css('.style-available')
      expect(find("##{accessinn.name.split('').first}")).to have_content("3 rooms left")
    end
  end
end
