class ApplicationController < ActionController::Base
  before_action :set_cart

  helper_method :current_order

  def current_user
    super&.decorate
  end

  def set_cart
    Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    session[:order_id] = Order.create.id
  ensure
    session[:order_items_count] = Order.find(session[:order_id]).order_items.count
  end

  def current_order
    Order.find(session[:order_id]).decorate
  end
end
