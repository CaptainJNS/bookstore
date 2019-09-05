class FilterBooksQuery
  def initialize(category)
    @category = category
  end

  def self.call(category)
    new(category).call
  end

  def call
    @category ? Category.find(@category).books : Book.all
  end
end
