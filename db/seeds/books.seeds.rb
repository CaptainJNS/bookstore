BOOKS_COUNT = 30
MATERIALS = ['glossy paper', 'hardcover', 'soft paper', 'cardboard'].map(&:capitalize!).freeze
DIMENSION = (1.0..10.0).freeze

after :authors, :categories do
  Book.destroy_all

  BOOKS_COUNT.times do |_index|
    Book.create! do |book|
      book.title        = FFaker::Book.unique.title
      book.description  = FFaker::Book.description
      book.price        = rand(5.0..500.00)
      book.quantity     = rand(1..100)
      book.dimensions   = "#{rand(DIMENSION).round(1)}\"x#{rand(DIMENSION).round(1)}\"x#{rand(DIMENSION).round(1)}\""
      book.year         = rand(1666..2019)
      book.materials    = MATERIALS.sample(rand(1..3)).join(', ')
      book.categories   = Category.all.sample(1)
      book.authors      = Author.all.sample(rand(1..2))
    end
  end
end

puts 'Books created'
