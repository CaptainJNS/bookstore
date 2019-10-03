require 'rails_helper'

RSpec.describe DefaultBooksQuery do
  before do
    create_list(:category, 4)
    create_list(:book, 10)
  end

  context 'with latest books' do
    it 'returns 3 last books' do
      expect(described_class.call(latest_books: nil)).to match_array(Book.last(Constants::LATEST_BOOK_COUNT))
    end
  end

  context 'with filtering books' do
    it 'returns books from chosen category' do
      Category.all.each do |category|
        described_class.call(category: category.id).each do |book|
          expect(book.categories.include?(category)).to be true
        end
      end
    end
  end

  context 'with sorting books' do
    it 'returns title ASC order' do
      described_class.call(sort_param: 'title ASC').each_cons(2) do |current_book, next_book|
        expect(current_book.title < next_book.title). to be true
      end
    end

    it 'returns title DESC order' do
      described_class.call(sort_param: 'title DESC').each_cons(2) do |current_book, next_book|
        expect(current_book.title > next_book.title). to be true
      end
    end

    it 'returns price ASC order' do
      described_class.call(sort_param: 'price ASC').each_cons(2) do |current_book, next_book|
        expect(current_book.price < next_book.price). to be true
      end
    end

    it 'returns price DESC order' do
      described_class.call(sort_param: 'price DESC').each_cons(2) do |current_book, next_book|
        expect(current_book.price > next_book.price). to be true
      end
    end

    it 'returns newest order' do
      described_class.call(sort_param: 'created_at DESC').each_cons(2) do |current_book, next_book|
        expect(current_book.created_at > next_book.created_at). to be true
      end
    end
  end
end
