require 'rails_helper'

RSpec.feature 'Rooms', type: :feature, js: true do
  let!(:room) { Room.all.sample }
  let!(:next_day) { Date.today.next_day }
  let!(:locale) { nil }

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
end
