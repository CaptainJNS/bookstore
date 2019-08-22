class BooksController < ApplicationController
  def index
    # binding.pry
    @books = (params[:category_id] ? Category.find(params[:category_id]).books : Book.all).page(params[:page]).per(8)
    # @books = Book.all.page(params[:page]).per(8)
  end

  def show
    @book = Book.find(params[:id])
  end
end
