require 'rails_helper'

RSpec.describe OrderItemDecorator do
  subject(:decorator) { described_class.new(order_item) }

  let(:order_item) { create(:order_item, quantity: 2, book: create(:book, price: 23.42)) }

  it '#price' do
    expect(decorator.price).to eq(2 * 23.42)
  end
end
