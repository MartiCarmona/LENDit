class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @products = @user.products
    @favorites = @user.favorites
    @bookings = @user.bookings
    render 'profile/profile'
  end
end
