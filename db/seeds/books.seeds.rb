BOOKS_COUNT = 50
MATERIALS = ['glossy paper', 'hardcover', 'soft paper', 'cardboard'].map(&:capitalize!).freeze
DIMENSION = (1.0..10.0).freeze

start_time = 0

after :authors, :categories do
  start_time = Time.now

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

finish_time = Time.now

puts "Books created in #{finish_time - start_time} seconds"
