class LatestBooksQuery
  LATEST_BOOKS_COUNT = 3

  def self.call
    new.call
  end

  def call
    Book.last(LATEST_BOOKS_COUNT)
  end
end
