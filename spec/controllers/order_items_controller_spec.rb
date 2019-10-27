require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let(:order) { create(:order) }

  describe 'GET index' do
    it 'renders :index template' do
      get :index, params: { order_id: order.id }
      expect(response).to render_template :index
    end
  end

  describe 'POST create' do
    let(:book) { create(:book) }

    it 'creates an OrderItem object' do
      expect { post(:create, params: { book_id: book.id, order_id: order.id }) }.to change(OrderItem, :count).by(1)
    end
  end

  describe 'DESTROY' do
    let!(:order_item) { create(:order_item, order: order) }

    it 'destroys an OrderItem object' do
      expect { delete(:destroy, params: { order_id: order.id, id: order_item.id }) }.to change(OrderItem, :count).by(-1)
    end
  end
end
