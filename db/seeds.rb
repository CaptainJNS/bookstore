CATEGORIES = ['Mobile development', 'Photo', 'Web design', 'Web development'].freeze
MATERIALS = ['glossy paper', 'hardcover', 'soft paper', 'cardboard'].freeze
AUTHORS_COUNT = 15
BOOKS_COUNT = 50
DIMENSION = (1.0..10.0).freeze

Book.destroy_all
Author.destroy_all
Category.destroy_all

CATEGORIES.each do |category|
  Category.create!(name: category)
end

AUTHORS_COUNT.times do |_index|
  Author.create! do |author|
    author.name = FFaker::Name.unique.name
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
    book.materials    = MATERIALS.sample(rand(1..3))
    book.categories   = Category.all.sample
    book.authors      = Author.all.sample(rand(1..3))
  end
end

# Book.all.each do |book|
#   rand(0..4).times do
#     book.images.attach(
#       io: File.open(Rails.root.join("app/assets/images/#{rand(1..9)}.jpg")),
#       filename: "cover.jpg",
#       content_type: "image/jpg"
#     )
#   end
# end
