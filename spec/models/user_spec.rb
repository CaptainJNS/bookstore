require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    it 'is invalid without email' do
      expect(build(:user, email: nil)).not_to be_valid
    end

    it 'is valid without name' do
      expect(build(:user, name: nil)).to be_valid
    end
  end
end
