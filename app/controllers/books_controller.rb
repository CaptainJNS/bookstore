class BooksController < ApplicationController
  def index
    @sorts = ['Newest first', 'ABC Title', 'ZYX Title', 'Price UP', 'Price DOWN']
    @books = (params[:category_id] ? Category.find(params[:category_id]).books : Book.all).page(params[:page]).per(8)
    @books = sort(params[:sort_by]) if params[:category_id]
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def sort(parameter)
    case parameter
    when '1' then title_ascending(@books)
    when '2' then title_descending(@books)
    when '3' then low_price(@books)
    when '4' then high_price(@books)
    else newest(@books)
    end
  end

  def newest(books)
    books.most_recent
  end

  def low_price(books)
    books.ascending_price
  end

  def high_price(books)
    books.descending_price
  end

  def title_ascending(books)
    books.ascending_title
  end

  def title_descending(books)
    books.descending_title
  end
end
