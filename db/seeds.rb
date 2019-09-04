CATEGORIES = ['Mobile development', 'Photo', 'Web design', 'Web development'].freeze
MATERIALS = ['glossy paper', 'hardcover', 'soft paper', 'cardboard'].map(&:capitalize!).freeze
AUTHORS_COUNT = 5
BOOKS_COUNT = 30
DIMENSION = (1.0..10.0).freeze

Book.destroy_all
Author.destroy_all
Category.destroy_all

CATEGORIES.each do |category|
  Category.create!(name: category)
end

AUTHORS_COUNT.times do |_index|
  Author.create! do |author|
    author.first_name = FFaker::Name.unique.first_name
    author.last_name = FFaker::Name.unique.last_name
  end
end

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

Book.all.each do |book|
  rand(0..3).times do
    book.images.attach(
      io: File.open(Rails.root.join("app/assets/images/#{rand(1..11)}.jpg")),
      filename: "cover.jpg",
      content_type: "image/jpg"
    )
  end
end

puts 'Succes!'
