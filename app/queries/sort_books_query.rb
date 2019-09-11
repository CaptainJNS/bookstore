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
    @parameter = parameter
  end

  def self.call(books, parameter)
    new(books, parameter).call
  end

  def call
    sort(@parameter)
  end

  private

  def sort(parameter)
    case parameter
    when '1' then @books.order('title ASC')
    when '2' then @books.order('title DESC')
    when '3' then @books.order('price ASC')
    when '4' then @books.order('price DESC')
    else @books.order('created_at DESC')
    end
  end
end
