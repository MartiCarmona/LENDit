class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    if params[:search].present?
      @products = Product.where("title ILIKE ? OR description ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    elsif params[:category_id].present?
      @products = Product.where(category_id: params[:category_id]).where.not(user: current_user)
    else
      if current_user.present?
        @products = Product.where.not(user: current_user).where.not(id: current_user.booked_products.pluck(:id))
      else
        @products = Product.all
      end
    end
  end

  def show
    @product = Product.find(params[:id])
    @booking = Booking.new
    @favorite = Favorite.new
    @booked_products = current_user.nil? ? [] : current_user.booked_products
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      flash[:success] = "Product successfully created!"
      redirect_to root_path
    else
      flash.now[:alert] = "Image format must be JPEG, JPG, or PNG" if @product.errors[:image].include?('must be a JPEG, JPG, or PNG')
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to profile_path(current_user), notice: 'Product was successfully updated.'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to profile_path(current_user), notice: 'Product was successfully deleted.', status: :see_other
  end

  def search
    @products = Product.search(params[:search])
    render 'index'
  end

  def toggle_favorite
    @product = Product.find(params[:id])
    current_user.toggle_favorite(@product)
    redirect_to product_path(@product), notice: 'Product marked as favorite successfully.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price_per_day, :condition, :category_id, :image)
  end
end
