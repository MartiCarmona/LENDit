class FavoritesController < ApplicationController
  def index
    @favorite_products = current_user.favorited_products
    @user = current_user


    render layout: "with_sidebar"
  end
end
