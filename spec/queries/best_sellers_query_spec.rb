require 'rails_helper'

RSpec.describe DefaultBooksQuery do
  let(:category1) { create(:category) }
  let(:category2) { create(:category) }

  let(:result) { described_class.call(params) }
  let(:params) { {} }
  let(:first_book) { create(:book, categories: [category1]) }
  let(:second_book) { create(:book, categories: [category2]) }
  let(:extra_book1) { create(:book, categories: [category1]) }
  let(:extra_book2) { create(:book, categories: [category2]) }

  context 'with best sellers' do
    let(:params) { { best_sellers: nil } }

    before do
      create(:order, status: 2)
      create(:order, status: 3)

      create(:order_item, quantity: 2, book: first_book, order: Order.all.sample)
      create(:order_item, quantity: 2, book: second_book, order: Order.all.sample)
      create(:order_item, quantity: 2, book: second_book, order: Order.all.sample)

      create(:order_item, quantity: 1, book: extra_book1, order: Order.all.sample)
      create(:order_item, quantity: 3, book: extra_book2, order: Order.all.sample)
    end

    it 'returns 4 top books from each category' do
      expect(result).to match_array([first_book, second_book])
    end
  end
end
