class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    review = Review.new(review_params)
    review.status = I18n.t('review.unprocessed')
    review.save

    redirect_to book_path(Book.find(params[:book_id]))
  end

  private

  def review_params
    params.require(:review).permit(:body, :book_id, :user_id, :rating)
  end
end
