class FavoritesController < ApplicationController
  def index
    @favorite_products = current_user.favorited_products
  end
end
