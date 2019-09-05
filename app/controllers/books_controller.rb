class BooksController < ApplicationController
  def index
    @sorts = ['Newest first', 'Title: A-Z ↑', 'Title: Z-A ↓', 'Price: to UP ↑', 'Price: to DOWN ↓']
    @books = FilterBooksQuery.call(params[:category]).page(params[:page]).per(8)
    @books = SortBooksQuery.call(@books, params[:sort_by])
  end

  def show
    @book = Book.find(params[:id])
  end
end
