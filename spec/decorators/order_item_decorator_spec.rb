require 'rails_helper'

RSpec.describe OrderItemDecorator do
  subject(:decorator) { described_class.new(order_item) }

  let(:order_item) { create(:order_item) }

  it '#price' do
    expect(decorator.price).to eq(order_item.book.price * order_item.quantity)
  end
end
