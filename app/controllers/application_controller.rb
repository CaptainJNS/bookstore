class ApplicationController < ActionController::Base
  def current_user
    super&.decorate
  end

  before_action :set_cart

  def set_cart
    Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    session[:order_id] = Order.create.id
  ensure
    session[:order_items_count] = Order.find(session[:order_id]).order_items.count
  end
end
