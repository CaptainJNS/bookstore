require 'rails_helper'

RSpec.describe UpdateTotalPrice do
  let(:service) { described_class.call(order, params) }
  let(:params) { {} }
  let(:order) { create(:order, order_items: [order_item]).decorate }
  let(:order_item) { create(:order_item, book: create(:book, price: 10)).decorate }
  let(:delivery) { create(:delivery, price: 10) }
  let(:coupon) { create(:coupon, discount: 50) }

  context 'with add order_item' do
    let(:params) { { order_item: order_item, action: :add } }

    it 'plus to total_price' do
      expect { service }.to change(order, :total_price).by(10)
    end
  end

  context 'with remove order_item' do
    let(:params) { { order_item: order_item, action: :remove } }

    it 'minus from total_price' do
      expect { service }.to change(order, :total_price).by(-10)
    end
  end

  context 'with add delivery' do
    let(:params) { { delivery: delivery } }

    it 'minus from total_price' do
      expect { service }.to change(order, :total_price).by(10)
    end
  end

  context 'with add coupon' do
    let(:params) { { coupon: coupon } }

    it 'minus from total_price' do
      order.update(coupon: coupon)

      expect { service }.to change(order, :total_price).by(-5)
    end
  end
end
