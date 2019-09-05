class Book < ApplicationRecord
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_and_belongs_to_many :categories
  has_many_attached :images

  validates :title, :description, :price, :year, :quantity, presence: true

  validates :price, numericality: { greater_than: 0, less_than_or_equal_to: 100_000 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
