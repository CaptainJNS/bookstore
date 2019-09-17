class BooksController < ApplicationController
  def index
    @book_count = Book.count
    @categories = Category.includes(:books).select(:id, :name)
    @sorts = SortBooksQuery.sort_options
    # @books = FilterSortBooksQuery.call(params[:category], params[:sort_by]).page(params[:page]).per(8)
    result = FilterSortBooksQuery.call(params[:category], params[:sort_by]).page(params[:page]).per(8)

    @books = BookDecorator.decorate_collection(result)
  end

  def show
    @book = Book.find(params[:id]).decorate
    @description_limit = 100
  end
end
