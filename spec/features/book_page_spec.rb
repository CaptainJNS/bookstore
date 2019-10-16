require 'rails_helper'

RSpec.describe 'Book page', type: :feature, js: true do
  let!(:book) { create(:book,
                        description: 'description' * Constants::DESCRIPTION_LIMIT,
                        quantity: 2) }

  before do
    visit(book_path(book))
  end

  context 'with description' do
    it 'shows full description' do
      click_link(I18n.t('book.more'))
      expect(page).to have_content(book.description)
    end
  end
end
