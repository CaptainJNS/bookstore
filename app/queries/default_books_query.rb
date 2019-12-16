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

    sql = %[SELECT DISTINCT ON (bc.category_id) b.*, SUM(oi.quantity) as total_quantity
            FROM order_items oi JOIN
                orders o
                ON oi.order_id = o.id JOIN
                books b
                ON oi.book_id = b.id
            INNER JOIN books_categories bc ON bc.book_id = b.id
            WHERE o.status in (2, 3)
            GROUP BY bc.category_id, b.id
            ORDER BY bc.category_id, total_quantity DESC]

    books_array = Book.find_by_sql(sql)
    relation.where(id: books_array.map(&:id))
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
    sort_param = I18n.t(:sorting).keys.include?(@params[:sort_param]&.to_sym) ? @params[:sort_param] : Constants::DEFAULT_BOOKS_ORDER
    return popular_first(relation) if sort_param == 'popular'

    relation.order(sort_param)
  end

  def popular_first(relation)
    relation.joins(:order_items).group(:id).order('count(order_items.id) desc')
  end
end
