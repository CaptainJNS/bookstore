class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :books, through: :order_items

  enum status: %i[created approved rejected]
end
