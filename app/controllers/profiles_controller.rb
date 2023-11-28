class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @products = @user.products
    @favorites = @user.favorites
    @bookings = @user.bookings
    @booked_products = @user.booked_products
  end
end
