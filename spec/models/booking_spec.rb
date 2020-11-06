require 'rails_helper'

RSpec.describe Booking, type: :model do
  it 'Booking valid with data' do
    booking = build(:booking)
    expect(booking).to be_valid
  end

  it 'Booking invalid with data' do
    booking1 = build(:booking, start_at: Date.today - 1)
    booking2 = build(:booking, end_at: Date.today)
    booking3 = build(:booking, user: nil)
    expect(booking1).not_to be_valid
    expect(booking2).not_to be_valid
    expect(booking3).not_to be_valid
  end

  context 'Validation' do
    it { is_expected.to belong_to(:room) }
    it { is_expected.to belong_to(:user) }
  end

  context 'methods' do
    it '#price' do
      booking = build(:booking)
      expect(booking.price.to_i).to eq(booking.room.category.price.to_i * 200)
    end
  end
end
