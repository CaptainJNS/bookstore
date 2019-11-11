require 'rails_helper'

RSpec.describe OrderDecorator do
  subject(:decorator) { described_class.new(order) }

  let(:order) { create(:order, order_items: order_items) }
  let(:order_items) do
    [
      create(:order_item, book: create(:book, price: 10)),
      create(:order_item, book: create(:book, price: 20)),
      create(:order_item, book: create(:book, price: 30))
    ]
  end

  it '#sub_price' do
    expect(decorator.sub_price).to eq(60)
  end

  it '#number' do
    allow(decorator).to receive(:id).and_return(1)
    expect(decorator.number).to eq('Order #1')
  end
end
