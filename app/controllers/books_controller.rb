class BooksController < ApplicationController
  def index
    @book_count = Book.count
    @categories = Category.select(:id, :name)
    @order_param = params[:sort_by] || Constants::DEFAULT_BOOKS_ORDER

    result = DefaultBooksQuery.call(category: params[:category], sort_param: params[:sort_by]).page(params[:page]).per(8)
    @books = BookDecorator.decorate_collection(result)
  end

  def show
    @book = Book.find(params[:id]).decorate
  end

  def update
    @book = Book.find(params[:id])
    # binding.pry
    @book.images.attach(
      io: params[:book][:images],
      filename: 'cover.jpg',
      content_type: 'image/jpg'
    )
  end

  private

  def book_params
    params.require(:book).permit(:images)
  end
end
