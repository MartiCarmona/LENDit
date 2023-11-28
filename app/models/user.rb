class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy

  has_many :bookings, dependent: :destroy
  has_many :booked_products, through: :bookings, source: :product

  has_many :favorites, dependent: :destroy
  has_many :favorited_products, through: :favorites, source: :product

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
end
