class ReviewsController < ApplicationController
  def create
    review = Review.new(review_params)
    review.status = 'Unprocessed'
    review.save

    redirect_to book_path(Book.find(params[:book_id]))
  end

  private

  def review_params
    params.require(:review).permit(:body, :book_id, :user_id)
  end
end
