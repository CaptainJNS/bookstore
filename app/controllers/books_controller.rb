class BooksController < ApplicationController
  def index
    @sorts = ['Newest first', 'ABC Title', 'ZYX Title', 'Price UP', 'Price DOWN']
    @books = (params[:category] ? Category.find(params[:category]).books : Book.all).page(params[:page]).per(8)
    @books = sort(params[:sort_by])
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def sort(parameter)
    case parameter
    when '1' then @books.ascending_title
    when '2' then @books.descending_title
    when '3' then @books.ascending_price
    when '4' then @books.descending_price
    else @books.most_recent
    end
  end
end
