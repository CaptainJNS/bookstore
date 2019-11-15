require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in(user) }

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

  describe 'GET index' do
    let(:params) { {} }

    before { get :index, params: params }

    context 'without params' do
      it { expect(response).to render_template :index }
    end

    context 'with status parameter 2' do
      let(:params) { { status: 2 } }

      it { expect(response).to render_template :index }
    end

    context 'with status parameter 3' do
      let(:params) { { status: 3 } }

      it { expect(response).to render_template :index }
    end

    context 'with status parameter 4' do
      let(:params) { { status: 4 } }

      it { expect(response).to render_template :index }
    end
  end

  describe 'GET show' do
    let(:order) { create(:order, user: user) }

    before { get :show, params: { id: order } }

    it { expect(response).to render_template :show }
  end
end
