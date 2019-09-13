after :books do
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

puts 'Images attached'
