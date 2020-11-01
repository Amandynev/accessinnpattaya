require 'rails_helper'

RSpec.describe User, type: :model do

  it 'User with valid data' do
    user = create(:user)
    expect(user).to be_valid
  end

  it 'User with invalid data' do
    user1 = build(:user, email: nil)
    user2 = build(:user, password: nil)
    expect(user1).not_to be_valid
    expect(user2).not_to be_valid
  end
end
