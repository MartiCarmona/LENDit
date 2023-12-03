class AddProductIdToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :product, null: false, foreign_key: true
  end
end
