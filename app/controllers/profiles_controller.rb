class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @products = @user.products
    @favorites = @user.favorites
    @bookings = @user.bookings
    @booked_products = @user.booked_products
    render layout: "with_sidebar"
  end
end
