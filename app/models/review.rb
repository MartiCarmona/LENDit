class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :user_id, presence: true

  validates :product_rating, presence: true, inclusion: { in: 1..5 }, numericality: { only_integer: true }, if: :by_renter?
  validates :product_content, presence: true, if: :by_renter?

  validates :booking_id, presence: true
  validates :booking_rating, presence: true, inclusion: { in: 1..5 }, numericality: { only_integer: true }
  validates :booking_content, presence: true


  def by_owner?
    user == booking.product.user
  end

  def by_renter?
    user == booking.user
  end

end
