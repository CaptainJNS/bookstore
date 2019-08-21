require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:book) { FactoryBot.create(:book) }

  describe 'GET #show' do
    it 'renders :show template' do
      get :show, params: { id: book.id }
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do
    it 'renders :index template' do
      get :index
      expect(response).to render_template :index
    end
  end
end
