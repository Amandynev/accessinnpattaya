require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'Should have 27 rooms' do
    expect(Room.count).to eq(27)
  end

  context 'Methods' do
    it '#services' do
      expect(Room.first.services).to include('Safety-box', 'Minibar', 'Air-condition')
      expect(Room.first.services).not_to include('none valid service')
    end
  end
end
