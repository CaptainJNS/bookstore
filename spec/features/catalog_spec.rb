require 'rails_helper'

RSpec.describe 'Catalog', type: :feature, js: true do
  before do
    create_list(:category, 4)
  end

  context 'with categories' do
    it 'shows books only from choosen category' do
      create_list(:book, 8)
      visit(books_path)
      Category.all.each do |category|
        find('.filter-link', text: category.name, match: :first).click
        extra_book = Book.joins(:books_categories).where.not(books_categories: { category_id: category.id }).sample
        DefaultBooksQuery.call(category: category.id).each do |book|
          expect(page).to have_content(book.title)
          expect(page).not_to have_content(extra_book.title)
        end
      end
    end
  end

  # context 'with sorting' do
  #   it 'shows books in choosen order' do
  #     create_list(:book, 8)
  #     visit(books_path)

  #     I18n.t(:sorting).each_pair do |key, value|
  #       find('li', text: value, match: :first).click
  #       click_link(value, match: :first)
  #       DefaultBooksQuery.call(sort_param: key).each_with_index do |book, index|
  #         expect(all('.title')[index]).to have_content(book.title)
  #       end
  #     end
  #   end
  # end

  context 'with view more', skip_before: true do
    it 'shows more books' do
      create_list(:book, 9)
      visit(books_path)

      expect { click_link(I18n.t('shop.more')) }.to change { all('.title').count }.by(1)
    end

    it 'hides when all books are shown' do
      create_list(:book, 9)
      visit(books_path)

      expect(page).to have_content(I18n.t('shop.more'))
      click_link(I18n.t('shop.more'))
      expect(page).not_to have_content(I18n.t('shop.more'))
    end
  end

  context 'with an eye icon' do
    it 'shows a book page' do
      create(:book)
      visit(books_path)

      link = find('.thumb-hover-link', match: :first)['href']
      find('.fa-eye', match: :first).click
      expect(page).to have_current_path(link)
    end
  end
end
