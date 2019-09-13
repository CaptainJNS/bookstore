class HomeController < ApplicationController
  def index
    @latest_books = BookDecorator.decorate_collection(LatestBooksQuery.call)
    @best_sellers = BookDecorator.decorate_collection(BestSellersQuery.call)
  end
end
