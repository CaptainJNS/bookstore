CATEGORIES = ['Mobile development', 'Photo', 'Web design', 'Web development'].freeze

Category.destroy_all

CATEGORIES.each { |category| Category.create!(name: category) }

puts 'Categories created'
