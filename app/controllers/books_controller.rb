class BooksController < ApplicationController
  def index
    @book_count = Book.count
    @categories = Category.select(:id, :name)
    @order_param = params[:sort_by] || Constants::DEFAULT_BOOKS_ORDER

    result = DefaultBooksQuery.call(category: params[:category], sort_param: params[:sort_by]).page(params[:page]).per(Constants::BOOKS_PER_PAGE)
    @books = BookDecorator.decorate_collection(result)
  end

  def show
    @book = Book.find(params[:id]).decorate
    @reviews = ReviewDecorator.decorate_collection(Review.where('book_id = ? and status = ?', @book.id, I18n.t('review.approved')))
  end
end
