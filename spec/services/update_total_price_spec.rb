require 'rails_helper'

RSpec.describe UpdateTotalPrice do
  let(:service) { described_class.new }

  context '#call' do
    let(:order) { create(:order, order_items: [order_item]).decorate }
    let(:order_item) { create(:order_item).decorate }

    it 'plus to total_price' do
      expect do
        service.call(
          order,
          order_item.price,
          order_item.quantity,
          :add
        )
      end.to change(order, :total_price).by(order_item.price * order_item.quantity)
    end

    it 'minus from total_price' do
      expect do
        service.call(
          order,
          order_item.price,
          order_item.quantity,
          :remove
        )
      end.to change(order, :total_price).by(-1 * order_item.price * order_item.quantity)
    end
  end
end
