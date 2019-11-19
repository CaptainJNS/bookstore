require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'POST update' do
    let(:order) { create(:order) }

    context 'with valid coupon code' do
      let(:coupon) { create(:coupon) }

      it 'updates order and shows a notice' do
        post :update, params: { id: order.id, coupon: { code: coupon.code } }
        expect(flash[:notice]).to eq(I18n.t('coupons.attached'))
      end
    end

    context 'with invalid coupon code' do
      it 'updates order and shows a notice' do
        post :update, params: { id: order.id, coupon: { code: 'non-existing code' } }
        expect(flash[:alert]).to eq(I18n.t('coupons.invalid'))
      end
    end
  end
end
