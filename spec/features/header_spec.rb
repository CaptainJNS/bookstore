require 'rails_helper'

RSpec.describe 'Header', type: :feature, js: true do
  context 'when default' do
    it 'opens Home page' do
      # find('a', match: :first).trigger('click')
      # find(content: I18n.t('default.homepage'), match: :first).click
      # expect(page).to have_current_path(root_path)
    end
  end
end
