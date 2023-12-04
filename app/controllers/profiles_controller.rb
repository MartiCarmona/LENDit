class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @products = @user.products
    @favorites = @user.favorites
    @bookings = @user.bookings
    @booked_products = @user.booked_products
    @received_bookings = @user.received_bookings
    if current_user == @user
      render layout: "with_sidebar"
    else
      render "profiles/show", layout: "without_sidebar"
    end
  end
end
