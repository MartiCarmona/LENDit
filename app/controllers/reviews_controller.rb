class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_booking, only: [:new, :create]

  def index
    @received_reviews = Review.where(user_id: current_user.id)

    render layout: "with_sidebar"
  end


  def new
    if @booking.status == 'accepted' && @booking.in?(Booking.finished)
      @review = Review.new
    else
      redirect_to root_path, alert: 'You can only add a review for an accepted and finished booking.'
    end
  end

  def create
    existing_review = Review.find_by(user_id: current_user.id, booking_id: @booking.id)

    if existing_review
      redirect_to profile_path(current_user), alert: 'You already reviewed this booking.'

    elsif @booking.status == 'accepted' && @booking.in?(Booking.finished)

      @review = Review.new(review_params)
      @review.user_id = current_user.id
      @review.booking_id = @booking.id
        if current_user == @booking.product.user
          @review.product_content = "Content"
          @review.product_rating = 1
        end

      if @review.save
        redirect_to profile_path(current_user), notice: 'Review was successfully created.'

      else
        render :new, status: 422, flash_alert: 'Review was not created.'
      end
    else
      redirect_to root_path, alert: 'You can only add a review for an accepted and finished booking.'
    end
  end




  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product), status: :see_other
  end

  private

  def load_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:product_rating, :product_content, :booking_rating, :booking_content, :booking_id, :user_id, :review_type)
  end


end
