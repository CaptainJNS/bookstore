class DefaultBooksQuery
  def initialize(**params)
    @params = params
  end

  def self.call(**params)
    new(**params).call
  end

  def call
    Book
      .yield_self(&method(:best_sellers))
      .yield_self(&method(:latest_books))
      .yield_self(&method(:filter))
      .yield_self(&method(:sort))
  end

  private

  def best_sellers(relation)
    return relation unless @params.include?(:best_sellers)

    relation.first(4)
  end

  def latest_books(relation)
    return relation unless @params.include?(:latest_books)

    relation.last(Constants::LATEST_BOOK_COUNT)
  end

  def filter(relation)
    return relation unless @params[:category].present?

    relation.joins(:books_categories).where(books_categories: { category_id:  @params[:category] })
  end

  def sort(relation)
    return relation unless @params[:sort_param].present?

    sort_param = @params[:sort_param] || Constants::DEFAULT_BOOKS_ORDER

    relation.order(sort_param)
  end
end
