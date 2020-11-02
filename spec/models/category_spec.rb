require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'Should have 5 categories' do
    expect(Category.all.size).to eq(5)
  end
end