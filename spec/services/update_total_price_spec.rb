require 'rails_helper'

RSpec.describe UpdateTotalPrice do
  let(:service) { described_class.call(order, order_item, action) }
  let(:order) { create(:order, order_items: [order_item]).decorate }
  let(:order_item) { create(:order_item, book: create(:book, price: 10)).decorate }

  context 'with add action' do
    let(:action) { :add }

    it 'plus to total_price' do
      expect { service }.to change(order, :total_price).by(10)
    end
  end

  context 'with remove action' do
    let(:action) { :remove }

    it 'minus from total_price' do
      expect { service }.to change(order, :total_price).by(-10)
    end
  end
end
