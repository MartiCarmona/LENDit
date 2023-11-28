class Booking < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :reviews

  validate :unique_booking_for_user
  validate :cannot_book_own_product

  private

  def unique_booking_for_user
    if user.bookings.where(product: product, status: 'booked').exists?
      errors.add(:base, 'You have already booked this product.')
    end
  end

  def cannot_book_own_product
    if user == product.user
      errors.add(:base, 'You cannot book your own product.')
    end
  end
end
