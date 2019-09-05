class HomeController < ApplicationController
  def index
    @latest_books = LatestBooksQuery.call
    @best_sellers = BestSellersQuery.call
  end
end
