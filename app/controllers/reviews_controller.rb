class ReviewsController < ApplicationController


  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])

    if @booking.present?
      @product = @booking.product
    else
      flash[:alert] = 'Booking not found.'
      redirect_to root_path
      return
    end
  end


  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_reviews_path(@product)
    else
      render 'index'  # This should render the new.html.erb template for reviews
    end
  end



  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product), status: :see_other
  end

  private

def review_params
  params.require(:review).permit(:rating, :content, :user_id, :booking_id)
end

end
