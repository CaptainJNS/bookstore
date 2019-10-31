class RemoveShippingMethodFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :shipping_method, :integer
  end
end
