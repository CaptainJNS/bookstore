start_time = 0

after :books do
  start_time = Time.now

  Book.all.each do |book|
    rand(0..3).times do
      book.images.attach(
        io: open("https://book-store-dmitriev.s3.eu-west-2.amazonaws.com/#{rand(1..11)}.jpg"),
        filename: 'cover.jpg',
        content_type: 'image/jpg'
      )
    end

    next unless book.images.empty?

    book.images.attach(
      io: open('https://book-store-dmitriev.s3.eu-west-2.amazonaws.com/no_cover.jpg'),
      filename: 'no_cover.jpg',
      content_type: 'image/jpg'
    )
  end
end

finish_time = Time.now

puts "Images attached in #{finish_time - start_time} seconds"
