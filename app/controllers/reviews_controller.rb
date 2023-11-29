class ReviewsController < ApplicationController


  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product)
    else
      render 'products/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
