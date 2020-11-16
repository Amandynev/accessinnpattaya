require 'rails_helper'

RSpec.feature "Pages", type: :feature, js: true do
  let!(:next_day) { Date.today.next_day }

  describe 'Home Page' do
    it 'Visit the index page' do
      visit(root_path)
      expect(page).to have_current_path(root_path)
    end

    it 'Search rooms available through home page' do
      visit(root_path)
      click_on('commit')
      expect(page).to have_css('.available')
    end

    it 'Go to the restaurant_path through home page' do
      visit(root_path)
      find('.container-restau').click_link('More infos')
      expect(page).to have_current_path(restaurant_path)
    end
  end

  describe 'NavBar' do
    it 'Go to the home page through navbar' do
      visit(root_path)
      click_on(I18n.t('navbar.menu-1'))
      expect(page).to have_current_path(root_path)
    end
    it 'Go to the room page through navbar' do
      visit(root_path)
      click_on(I18n.t('navbar.menu-2'))
      expect(page).to have_current_path(rooms_path)
    end
    it 'Go to the restaurant page through navbar' do
      visit(root_path)
      click_on(I18n.t('navbar.menu-3'))
      expect(page).to have_current_path(restaurant_path)
    end
    it 'Go to the event page through navbar' do
      visit(root_path)
      click_on(I18n.t('navbar.menu-4'))
      expect(page).to have_current_path(event_path)
    end
    it 'Go to the contact page through navbar' do
      visit(root_path)
      click_on(I18n.t('navbar.menu-5'))
      expect(page).to have_current_path(contact_path)
    end
  end

  describe 'FlatPickr' do
    it 'Home page should handle a date change' do
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
  end

  describe 'Contact' do
    it 'Fields can\'t be blank' do
      visit(contact_path)
      fill_in('page_name', with: '')
      fill_in('page_email', with: '')
      fill_in('page_message', with: '')
      fill_in('page_phone', with: '')
      expect(find('.text-error-name')).to have_content('Name cannot be blank')
      expect(find('.text-error-email')).to have_content('Email cannot be blank')
      expect(find('.text-error-message')).to have_content('Message cannot be blank')
    end

    it 'Should not allowed false email' do
      visit(contact_path)
      fill_in('page_email', with: 'max@lewagon')
      fill_in('page_phone', with: '')
      expect(find('.text-error-email')).to have_content('Email is not valid')
    end
  end
end
