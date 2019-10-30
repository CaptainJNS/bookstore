class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    review = Review.create(review_params)

    redirect_to book_path(review.book), notice: I18n.t('review.created')
  end

  private

  def review_params
    params.require(:review).permit(:body, :book_id, :user_id, :rating)
  end
end
