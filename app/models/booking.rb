class Booking < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :reviews

  validate :unique_booking_for_user
  validate :cannot_book_own_product

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :valid_dates

  enum status: {
    booked: 'booked',
    pending_lend: 'pending_lend',
    accepted_lend: 'accepted_lend',
    declined_lent: 'declined_lend',
    pending_borrow: 'pending_borrow',
    accepted_borrow: 'accepted_borrow',
    declined_borrow: 'declined_borrow'
  }

  private

  def valid_dates
    return unless start_date && end_date

    if start_date < Date.today
      errors.add(:start_date, 'cannot be in the past')
    end

    if end_date <= start_date
      errors.add(:end_date, 'must be after the start date')
    end
  end

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
