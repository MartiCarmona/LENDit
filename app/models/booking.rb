class Booking < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :reviews

  validate :unique_booking_for_user

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :valid_dates

  enum status: {
    pending: 'pending',
    accepted: 'accepted',
    declined: 'declined',
    ongoing: 'ongoing',
    finished: 'finished'
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
    booked_statuses = ['pending', 'accepted', 'declined', 'ongoing']

    if user.bookings.where(product: product, status: booked_statuses).exists?
      errors.add(:base, 'You are currently booking  this product.')
    end
  end
end
