class AddReviewTypeToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :review_type, :string
  end
end
