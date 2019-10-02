require 'rails_helper'

RSpec.describe 'Book page', type: :feature, js: true do
  let!(:book) { create(:book,
                        description: 'description' * Constants::DESCRIPTION_LIMIT,
                        quantity: 2) }

  before do
    visit(book_path(book))
  end

  # context 'with price' do
  #   it 'changes price when plus/minus clicked' do
  #     expect { find('.fa-plus').click }.to change { find('.quantity-input')['value'].to_i }.by(1)
  #     expect(page).to have_content(ActiveSupport::NumberHelper.number_to_currency(book.price * 2))

  #     expect { find('.fa-minus').click }.to change { find('.quantity-input')['value'].to_i }.by(-1)
  #     expect(page).to have_content(ActiveSupport::NumberHelper.number_to_currency(book.price))
  #   end
  # end

  context 'with description' do
    it 'shows full description' do
      click_link(I18n.t('book.more'))
      expect(page).to have_content(book.description)
    end
  end
end
