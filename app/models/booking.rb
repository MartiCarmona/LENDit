class Booking < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :reviews
  has_one_attached :image

  validate :unique_booking_for_user

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :valid_dates

  scope :upcoming, -> { where(status: "accepted").where("start_date > ?", Date.today) }
  scope :finished, -> { where(status: "accepted").where("end_date < ?", Date.today) }
  scope :ongoing, -> { where(status: "accepted").where("start_date <= ? AND end_date >= ?", Date.today, Date.today) }

  enum status: {
    pending: 'pending',
    accepted: 'accepted',
    declined: 'declined'
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
  end


end
