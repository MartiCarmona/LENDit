class ModifyReviewsTable < ActiveRecord::Migration[6.0]
  def change
    # Remove the existing index
    remove_index :reviews, name: 'index_reviews_on_booking_id'

    # Remove the existing columns
    remove_column :reviews, :rating
    remove_column :reviews, :content
    remove_column :reviews, :product_id

    # Add new columns
    add_column :reviews, :product_rating, :integer
    add_column :reviews, :product_content, :text
    add_column :reviews, :booking_rating, :integer
    add_column :reviews, :booking_content, :text

    # Add new index
    add_index :reviews, :booking_id, name: 'index_reviews_on_booking_id'
  end
end
