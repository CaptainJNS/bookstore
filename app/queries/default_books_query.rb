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

    relation.last(I18n.t('constants.latest_book_count'))
  end

  def filter(relation)
    return relation unless @params[:category]

    Category.find(@params[:category]).books
  end

  def sort(relation)
    return relation unless @params[:sort_param]

    sort_param = @params[:sort_param].gsub(/([a-z_]*)_([A-Z]*)/, '\1 \2')
    relation.order(sort_param)
  end
end
