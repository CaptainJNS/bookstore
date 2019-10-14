class Book < ApplicationRecord
  has_many :authors_books, dependent: :destroy
  has_many :authors, through: :authors_books
  # accepts_nested_attributes_for :authors

  has_many :books_categories, dependent: :destroy
  has_many :categories, through: :books_categories

  has_many_attached :images

  validates :title, :description, :price, :year, :quantity, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100_000 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
