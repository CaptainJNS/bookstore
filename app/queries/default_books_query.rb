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

    books_ids = []

    Category.all.each do |category|
      temp_hash = OrderItem.joins(:book)
        .where(book: Book.joins(:books_categories)
        .where(books_categories: { category: category }))
        .joins(:order).where(orders: { status: [2,3] })
        .group(:book_id).sum(:quantity)

      books_ids << temp_hash.key(temp_hash.values.max)
    end

    relation.where(id: books_ids)
  end

  def latest_books(relation)
    return relation unless @params.include?(:latest_books)

    relation.order('created_at DESC').limit(Constants::LATEST_BOOK_COUNT)
  end

  def filter(relation)
    return relation unless @params[:category].present?

    relation.joins(:books_categories).where(books_categories: { category_id: @params[:category] })
  end

  def sort(relation)
    sort_param = @params[:sort_param] || Constants::DEFAULT_BOOKS_ORDER

    relation.order(sort_param)
  end
end
