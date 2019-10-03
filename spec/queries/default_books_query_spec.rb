require 'rails_helper'

RSpec.describe DefaultBooksQuery do
  # before do
  #   create_list(:category, 4)
  #   create_list(:book, 10)
  # end

  context 'with latest books' do
    it 'returns 3 last books' do
      create_list(:book, Constants::LATEST_BOOK_COUNT + 1)
      expect(described_class.call(latest_books: nil)).to match_array(Book.last(Constants::LATEST_BOOK_COUNT))
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

  context 'with sorting books' do
    let(:first_book) { create(:book, title: 'AAA', price: 1) }
    let(:second_book) { create(:book, title: 'BBB', price: 2) }

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
