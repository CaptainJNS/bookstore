require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  let(:card) { build(:credit_card) }

  context 'with associations' do
    it 'belongs to user' do
      expect(card).to respond_to :user
    end
  end
end
