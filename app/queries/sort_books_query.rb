class SortBooksQuery
  SORT_OPTIONS = [
    'Newest first',
    'Title: A-Z ↑',
    'Title: Z-A ↓',
    'Price: to UP ↑',
    'Price: to DOWN ↓'
  ].freeze

  def self.sort_options
    SORT_OPTIONS
  end

  def initialize(books, parameter)
    @books = books
    @parameter = parameter.to_i
  end

  def self.call(books, parameter)
    new(books, parameter).call
  end

  def call
    sort(@parameter)
  end

  private

  SORTING_HASH = {
    1 => 'title ASC',
    2 => 'title DESC',
    3 => 'price ASC',
    4 => 'price DESC'
  }

  def sort(parameter)
    return @books.order('created_at DESC') unless parameter.between?(1, SORTING_HASH.count)

    @books.order(SORTING_HASH[parameter])
  end
end
