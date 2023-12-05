class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @products = @user.products
    @favorites = @user.favorites
    @bookings = @user.bookings
    @booked_products = @user.booked_products
    @received_bookings = @user.received_bookings

    @reviews = Review.all.select { |review| (review.booking.product.user == @user || review.booking.user == @user) && review.user != @user }


    @average_booking_rating = @reviews.select { |review| review.review_type == 'booking' }.map(&:booking_rating).reduce(:+).to_f / @reviews.count

    if current_user == @user
      render layout: "with_sidebar"
    else
      render "profiles/show", layout: "without_sidebar"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_photo, :address)
  end
end
