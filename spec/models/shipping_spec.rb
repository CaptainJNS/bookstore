require 'rails_helper'

RSpec.describe Shipping, type: :model do
  context 'with associations' do
    it 'belongs to user' do
      shipping = create(:shipping, user: create(:user))
      expect(shipping).to respond_to :user
    end
  end

  context 'with validation' do
    it 'is invalid with no integer zip' do
      expect(build(:shipping, zip: '49000')).not_to be_valid
    end

    it 'is invalid with incorrect phone number' do
      expect(build(:shipping, phone: 'phone-number')).not_to be_valid
    end
  end
end
