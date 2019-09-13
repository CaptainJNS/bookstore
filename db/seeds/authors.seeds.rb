AUTHORS_COUNT = 5

Author.destroy_all

AUTHORS_COUNT.times do |_index|
  Author.create! do |author|
    author.first_name = FFaker::Name.unique.first_name
    author.last_name = FFaker::Name.unique.last_name
  end
end

puts 'Authors created'
