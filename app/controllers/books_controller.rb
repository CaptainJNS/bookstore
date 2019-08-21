class BooksController < ApplicationController
  def index
    @books = Book.all.page(params[:page]).per(4)
  end

  def show
    @book = Book.find(params[:id])
  end
end
