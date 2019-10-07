start_time = 0

after :books do
  start_time = Time.now

  Book.all.each do |book|
    rand(0..3).times do
      book.images.attach(
        io: File.open(Rails.root.join("app/assets/images/#{rand(1..11)}.jpg")),
        filename: 'cover.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end

finish_time = Time.now

puts "Images attached in #{finish_time - start_time} seconds"
