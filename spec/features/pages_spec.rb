require 'rails_helper'

RSpec.feature "Pages", type: :feature, js: true do
  let(:next_day) { Date.today.next_day }
  describe 'Simple views' do
    it 'Visit the index page' do
      visit(root_path)
      expect(page).to have_current_path(root_path)
    end
    it 'Should handle a date change' do
      visit(root_path)
      fill_in('range_start', with: Date.today.next_month.prev_day.to_s)
      fill_in('range_end', with: next_day.next_month.next_month.to_s)
      fill_in('range_start', with: Date.today.next_month.to_s)
      fill_in('range_end', with: next_day.next_month.next_month.to_s)
      expect(page).to have_css('.flatpickr-month')
      expect(find('#start-month-calendar')).to have_content(Date::ABBR_MONTHNAMES[Date.today.month + 1].to_s)
      expect(find('#end-month-calendar')).to have_content(Date::ABBR_MONTHNAMES[next_day.month + (next_day == 1 ? 2 : 3)].to_s)
      expect(find('#end-day-calendar')).to have_content(next_day.next_month.next_month.day.to_s)
    end
    it 'Visit the contact page' do
      visit(contact_path)
      expect(page).to have_current_path(contact_path)
    end
  end
end
