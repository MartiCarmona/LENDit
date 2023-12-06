class BookingsController < ApplicationController
  before_action :authenticate_user!

  def show
    @booking = Booking.find(params[:id])
    @product = @booking.product
    @user = @booking.user
    @reviews = @booking.reviews
    @review = Review.find_by(booking_id: @booking.id, user_id: current_user.id)

    render layout: "with_sidebar"
  end

  def lends
    @pending_lend_requests = current_user.received_bookings.where(status: 'pending')
    @accepted_lend_requests = current_user.received_bookings.upcoming
    @finished_lend_requests = current_user.received_bookings.finished
    @ongoing_lend_requests = current_user.received_bookings.ongoing
    @user = current_user

    render layout: 'with_sidebar'
  end

  def borrows
    @pending_borrow_requests = current_user.bookings.where(status: 'pending')
    @accepted_borrow_requests = current_user.bookings.upcoming
    @finished_borrow_requests = current_user.bookings.finished
    @ongoing_borrow_requests = current_user.bookings.ongoing
    @user = current_user


    render layout: 'with_sidebar'
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.status == 'pending'
      if @booking.start_date > Date.today
        @booking.update(status: 'accepted')
      elsif @booking.start_date <= Date.today && @booking.end_date >= Date.today
        @booking.update(status: 'accepted')
      else
        @booking.update(status: 'finished')
      end

      respond_to do |format|
        format.html { redirect_to lends_bookings_path, notice: 'Booking request updated.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to lends_bookings_path, alert: 'Invalid booking status.' }
        format.js
      end
    end
  end

  def new
    @booking = Booking.new
    @booking.user = current_user
    @booking.product = Product.find(params[:event_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.product = Product.find(params[:product_id])
    @booking.status = 'pending'

    if @booking.save
      chat = Chat.find_or_create_by(booking_id: @booking.id)
      redirect_to chat_path(chat), notice: 'Booking request sent.'
    else
      redirect_to product_path(@booking.product), notice: 'Booking request could not be sent.'
    end
  end


  def accept
    @booking = Booking.find(params[:id])
    update_booking_status('accepted')
  end

  def decline
    @booking = Booking.find(params[:id])
    update_booking_status('declined')
    Chat.find_by(booking_id: @booking.id).destroy
  end

  def cancel
    @booking = Booking.find(params[:id])

    @booking.destroy


  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def update_booking_status(new_status)
    return unless ['pending', 'accepted'].include?(@booking.status)

    if @booking.update(status: new_status)
      respond_to do |format|
        format.html { redirect_to lends_bookings_path, notice: 'Booking request updated.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to lends_bookings_path, alert: 'Invalid booking status.' }
        format.js
      end
    end
  end
end
