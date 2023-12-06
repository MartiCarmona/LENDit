class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy

  has_many :bookings, dependent: :destroy
  has_many :booked_products, through: :bookings, source: :product
  has_many :received_bookings, through: :products, source: :bookings

  has_many :favorites, dependent: :destroy
  has_many :favorited_products, through: :favorites, source: :product
  has_one_attached :profile_photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :reviews, foreign_key: :user_id
  has_many :received_reviews, through: :reviews, source: :booking



  def toggle_favorite(product)
    if favorited_products.include?(product)
      favorited_products.delete(product)
    else
      favorited_products << product
    end
  end

  def show
    @user = User.find(params[:id])
    @products = @user.products
    @booked_products = @user.booked_products
  end

  def name_with_initial
    "#{first_name} #{last_name.first}."
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
