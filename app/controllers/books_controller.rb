class BooksController < ApplicationController
  def index
    @book_count = Book.count
    @categories = Category.select(:id, :name)
    params[:sort_by] ||= 'created_at_DESC'

    result = DefaultBooksQuery.call(category: params[:category], sort_param: params[:sort_by]).page(params[:page]).per(8)
    @books = BookDecorator.decorate_collection(result)
  end

  def show
    @book = Book.find(params[:id]).decorate
  end
end
