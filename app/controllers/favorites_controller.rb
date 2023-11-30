class FavoritesController < ApplicationController
  def index
    @favorite_products = current_user.favorited_products

    render layout: "with_sidebar"
  end
end
