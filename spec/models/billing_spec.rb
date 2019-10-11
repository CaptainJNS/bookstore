require 'rails_helper'

RSpec.describe Billing, type: :model do
  context 'with associations' do
    it 'belongs to user' do
      billing = create(:billing, user: create(:user))
      expect(billing).to respond_to :user
    end
  end

  context 'with validation' do
    it 'is invalid with no integer zip' do
      expect(build(:billing, zip: '49000')).not_to be_valid
    end

    it 'is invalid with incorrect phone number' do
      expect(build(:billing, phone: 'phone-number')).not_to be_valid
    end
  end
end
