CATEGORIES = ['Mobile development', 'Photo', 'Web design', 'Web development'].freeze

Category.destroy_all

start_time = Time.now

CATEGORIES.each { |category| Category.create!(name: category) }

finish_time = Time.now

puts "Categories created in #{finish_time - start_time} seconds"
