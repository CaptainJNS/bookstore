require 'rails_helper'

RSpec.describe DefaultBooksQuery do
  let(:result) { described_class.call(params) }
  let(:params) { {} }
  let!(:first_book) { create(:book, title: 'AAA', price: 1) }
  let!(:second_book) { create(:book, title: 'BBB', price: 2) }
  let!(:third_book) { create(:book) }

  context 'with latest books' do
    let(:params) { { latest_books: nil } }

    before do
      stub_const('Constants::LATEST_BOOK_COUNT', 2)
    end

    it 'returns 2 last books' do
      expect(result).to match_array([third_book, second_book])
    end
  end

  context 'with filtering books' do
    it 'returns books from chosen category' do
      create_list(:category, 2)
      create_list(:book, 6)
      Category.all.each do |category|
        described_class.call(category: category.id).each do |book|
          expect(book.categories.include?(category)).to be true
        end
      end
    end
  end
#два контекста: с параметром (любым) и без
  context 'with sorting books' do
    it 'returns title ASC order' do
      expect(described_class.call(sort_param: 'title ASC')).to match_array([first_book, second_book])
    end

    it 'returns title DESC order' do
      expect(described_class.call(sort_param: 'title DESC')).to match_array([second_book, first_book])
    end

    it 'returns price ASC order' do
      expect(described_class.call(sort_param: 'price ASC')).to match_array([first_book, second_book])
    end

    it 'returns price DESC order' do
      expect(described_class.call(sort_param: 'price DESC')).to match_array([second_book, first_book])
    end

    it 'returns newest order' do
      expect(described_class.call(sort_param: 'created_at DESC')).to match_array([second_book, first_book])
    end
  end
end
