require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:book) { FactoryBot.build_stubbed(:book) }

  describe 'GET #show' do
    it 'renders :show template' do
      get :show, params: { id: book.id }
      expect(response).to render_template :show
    end
  end
end
