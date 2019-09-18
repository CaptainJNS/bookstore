class HomeController < ApplicationController
  def index
    @latest_books = BookDecorator.decorate_collection(DefaultBooksQuery.call(latest_books: nil))
    @best_sellers = BookDecorator.decorate_collection(DefaultBooksQuery.call(best_sellers: nil))
  end
end
