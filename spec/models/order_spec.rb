require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Order valid with data' do
    order = build(:order)
    expect(order).to be_valid
  end

  it 'Order invalid with data' do
    order = build(:order, user: nil)
    order2 = build(:order, state: "not in list")
    expect(order).not_to be_valid
    expect(order2).not_to be_valid
  end

  context 'Validation' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to monetize(:amount_cents) }
  end
end
