class BooksController < ApplicationController
  def index
    @book_count = Book.count
    @categories = Category.includes(:books)
    @sorts = SortBooksQuery.sort_options
    @books = FilterSortBooksQuery.call(params[:category], params[:sort_by]).page(params[:page]).per(8)
  end

  def show
    @book = Book.find(params[:id])
  end
end
