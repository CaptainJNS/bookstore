require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #show' do
    let(:book) { create(:book) }

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

    it 'when ascending title' do
      get :index, params: { sort_by: '1' }
      expect(response).to render_template :index
    end

    it 'when descending title' do
      get :index, params: { sort_by: '2' }
      expect(response).to render_template :index
    end

    it 'when ascending price' do
      get :index, params: { sort_by: '3' }
      expect(response).to render_template :index
    end

    it 'when descending price' do
      get :index, params: { sort_by: '4' }
      expect(response).to render_template :index
    end
  end
end
