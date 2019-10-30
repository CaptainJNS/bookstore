require 'rails_helper'

RSpec.describe 'Cart page', type: :feature, js: true do
  let(:current_order) { create(:order) }

  before do
    visit(order_order_items_path(current_order))
  end

  context 'with valid coupon' do
    let(:coupon) { create(:coupon) }

    it 'applies coupon' do
      fill_in 'coupon[code]', with: coupon.code
      find('#apply-coupon').click
      expect(page).to have_content('Coupon attached!')
    end
  end

  context 'with invalid coupon' do
    let(:coupon) { create(:coupon) }

    it 'shows error message' do
      fill_in 'coupon[code]', with: 'non-existing code'
      find('#apply-coupon').click
      expect(page).to have_content('You\'ve entered invalid coupon code')
    end
  end
end
