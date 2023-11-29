class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @products = @user.products
    @favorites = @user.favorites
    @bookings = @user.bookings
  end
end
