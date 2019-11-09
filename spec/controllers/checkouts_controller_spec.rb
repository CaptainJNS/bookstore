require 'rails_helper'

RSpec.describe CheckoutsController, type: :controller do
  let(:user) { create(:user) }
  let(:order_item) { create(:order_item) }
  let(:order) { create(:order, order_items: [order_item]) }
  let(:delivery) { create(:delivery) }

  before do
    allow(controller).to receive(:current_order).and_return(order)
    allow(controller).to receive(:current_user).and_return(user)
    sign_in(user)
  end

  describe '#show' do
    context 'with :address step' do
      it 'updates order status to in_progress' do
        get :show, params: { id: :address }
        expect(order.status).to eq('in_progress')
      end
    end

    context 'with :delivery step' do
      it 'renders next step' do
        create(:billing, user: user)

        get :show, params: { id: :delivery }
        expect(response).to render_template 'checkouts/delivery'
      end
    end

    context 'with :payment step' do
      it 'renders next step' do
        create(:billing, user: user)
        order.update(delivery: delivery)

        get :show, params: { id: :payment }
        expect(response).to render_template 'checkouts/payment'
      end
    end

    context 'with :confirm step' do
      it 'renders next step' do
        create(:billing, user: user)
        order.update(delivery: delivery)
        create(:credit_card, user: user)

        get :show, params: { id: :confirm }
        expect(response).to render_template 'checkouts/confirm'
      end
    end

    context 'with :complete step' do
      it 'sets order coupon to inactive and nullify order_id in session' do
        create(:billing, user: user)
        order.update(delivery: delivery)
        order.update(coupon: create(:coupon))
        create(:credit_card, user: user)
        order.update(status: 'in_delivery')

        get :show, params: { id: :complete }
        expect(order.coupon.active).to be false
        expect(session[:order_id]).to be nil
      end
    end
  end

  describe '#update' do
    context 'with :address step' do
      it 'attached billing to user' do
        put :update, params: { id: :address, user: { billing_attributes: attributes_for(:billing) } }
        expect(user.billing.present?).to be true
      end
    end

    context 'with :delivery step' do
      it 'attached delivery to order' do
        create(:billing, user: user)

        put :update, params: { id: :delivery, order: { delivery_id: delivery.id } }
        expect(order.delivery.present?).to be true
      end
    end

    context 'with :payment step' do
      it 'attached credit card to user' do
        create(:billing, user: user)
        order.update(delivery: delivery)

        put :update, params: { id: :payment, user: { credit_card_attributes: attributes_for(:credit_card) } }
        expect(user.credit_card.present?).to be true
      end
    end

    context 'with :confirm step' do
      it 'sets in_delivery status to order' do
        create(:billing, user: user)
        order.update(delivery: delivery)
        create(:credit_card, user: user)

        put :update, params: { id: :confirm }
        expect(order.status).to eq('in_delivery')
      end
    end
  end
end
