class HomeController < ApplicationController
  def index
    @latest_books = Book.all.last(3)
    @best_sellers = Book.all.sample(4)
  end
end
