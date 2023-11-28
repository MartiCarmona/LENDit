class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :bookings, dependent: :destroy
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user

  def favorited_by_user?(user)
    favorited_by_users.include?(user)
  end

  def image_format
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png' 'image/jpg'))
        errors.add(:images, 'needs to be a JPEG or PNG')
      end
    end
  end

  def booked_by_user?(user)
    bookings.include?(user)
  end

  def self.search(query)
    where("name ILIKE ? OR category ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end
end
