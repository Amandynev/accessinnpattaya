require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'Should have 27 rooms' do
    expect(Room.all.size).to eq(27)
  end
end
