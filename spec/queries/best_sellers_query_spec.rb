require 'rails_helper'

RSpec.describe DefaultBooksQuery do
  let(:category1) { create(:category) }
  let(:category2) { create(:category) }
  let(:category3) { create(:category) }
  let(:category4) { create(:category) }

  let(:result) { described_class.call(params) }
  let(:params) { {} }
  let!(:first_book) { create(:book, categories: [category1]) }
  let!(:second_book) { create(:book, categories: [category2]) }
  let!(:third_book) { create(:book, categories: [category3]) }
  let!(:fourth_book) { create(:book, categories: [category4]) }
  let(:extra_book1) { create(:book, categories: [category1]) }
  let(:extra_book2) { create(:book, categories: [category2]) }

  let!(:order1) { create(:order, status: 2) }
  let!(:order2) { create(:order, status: 3) }

  context 'with best sellers' do
    let(:params) { { best_sellers: nil } }

    before do
      create(:order_item, quantity: 5, book: first_book, order: Order.all.sample)
      create(:order_item, quantity: 4, book: second_book, order: Order.all.sample)
      create(:order_item, quantity: 3, book: third_book, order: Order.all.sample)
      create(:order_item, quantity: 2, book: fourth_book, order: Order.all.sample)

      create(:order_item, quantity: 1, book: extra_book1, order: Order.all.sample)
      create(:order_item, quantity: 1, book: extra_book2, order: Order.all.sample)
    end

    it 'returns 4 top books from each category' do
      expect(result).to match_array([first_book, second_book, third_book, fourth_book])
    end
  end
end
