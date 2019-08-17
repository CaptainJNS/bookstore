class Book < ApplicationRecord
  has_many :authors
  has_many :categories

  validates :title, :description, :price, :year, :quantity, :size, presence: true

  validates :price, numericality: { greater_or_equal_to: 0, less_than_or_equal_to: 100_000 }
  validates :quantity, numericality: { only_integer: true, greater_or_equal_to: 0 }
end
