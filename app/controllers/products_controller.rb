class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    if params[:search].present?
      @products = Product.where("title ILIKE ? OR description ILIKE ? OR category ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    elsif params[:category].present?
      @products = Product.where(category: params[:category]).where.not(user: current_user)
    else
      @products = Product.all.where.not(user: current_user)
    end
  end

  def show
    @product = Product.find(params[:id])
    @booking = Booking.new
    @favorite = Favorite.new
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

  # def edit
  #   @product = Product.find(params[:id])
  #   if @product.user != current_user
  #     flash[:alert] = "You can only edit your own products"
  #     redirect_to root_path
  #   end
  # end

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
    params.require(:product).permit(:title, :description, :price_per_day, :condition, :image, :category)
  end
end
