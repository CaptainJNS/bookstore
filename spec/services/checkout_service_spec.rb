require 'rails_helper'

RSpec.describe CheckoutService do
  let(:service) { described_class.call(step, params) }
  let(:params) { { order: order, user: user } }
  let(:step) {}
  let(:order) { create(:order, coupon: create(:coupon)) }
  let(:user) { create(:user) }

  before { service }

  context 'when :address step' do
    let(:step) { :address }

    it 'sets in_progress status to order' do
      expect(order.status).to eq('in_progress')
    end

    it 'sets user to order' do
      expect(order.user).to be user
    end
  end

  context 'when :complete step' do
    let(:step) { :complete }

    it 'sets in_delivery status to order' do
      expect(order.status).to eq('in_delivery')
    end

    it 'sets unactive status to order coupon' do
      expect(order.coupon.active).to be false
    end
  end
end
