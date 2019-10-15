class AddReviewsToBook < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :reviews, foreign_key: true
  end
end
