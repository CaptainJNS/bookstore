class FilterSortBooksQuery
  def initialize(category, sort_parameter)
    @books = FilterBooksQuery.call(category)
    @sort_parameter = sort_parameter
  end

  def self.call(category, sort_parameter)
    new(category, sort_parameter).call
  end

  def call
    SortBooksQuery.call(@books, @sort_parameter)
  end
end
