class FavoritesController < ApplicationController
  def index
    @favorite_products = current_user.favorite_products
  end
end
