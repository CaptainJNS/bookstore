require 'rails_helper'

RSpec.describe 'Home', type: :feature do
  before do
    create_list(:category, 4)
    create_list(:book, 7)

    visit(root_path)
  end

  context 'with carousel' do
    it 'shows the latest books' do
      within('.carousel') do
        DefaultBooksQuery.call(latest_books: nil).decorate.each do |book|
          expect(page).to have_content(book.title)
          expect(page).to have_content(book.authors_names)
        end
      end
    end
  end

  context 'with best sellers' do
    it 'shows the best sellers' do
      within('#bestsellers') do
        DefaultBooksQuery.call(best_sellers: nil).each do |book|
          expect(page).to have_content(book.title)
          expect(page).to have_content(ActiveSupport::NumberHelper.number_to_currency(book.price))
        end
      end
    end
  end

  context 'with main' do
    it 'opens books catalog', skip_before: true do
      visit(root_path)
      click_link(I18n.t('home.get_started'))
      expect(page).to have_current_path(books_path)
    end
  end
end
