class OrderDecorator < ApplicationDecorator
  delegate_all

  decorates_association :order_items

  def sub_price
    sum = 0
    order_items.each do |order_item|
      sum += order_item.price
    end
    sum
  end
end
