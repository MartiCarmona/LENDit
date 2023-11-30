# app/controllers/bookings_controller.rb

class BookingsController < ApplicationController
  before_action :authenticate_user!

  def lends
    @pending_lend_requests = current_user.received_bookings.where(status: 'pending')
    @accepted_lend_requests = current_user.received_bookings.where(status: 'accepted')
    render layout: "with_sidebar"
  end

  def borrows
    @pending_borrow_requests = current_user.bookings.where(status: 'pending')
    @accepted_borrow_requests = current_user.bookings.where(status: 'accepted')
    render layout: "with_sidebar"
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.status == 'pending'
      @booking.update(status: 'accepted')
      respond_to do |format|
        format.html { redirect_to lends_bookings_path, notice: 'Booking request accepted.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to lends_bookings_path, alert: 'Invalid booking status.' }
        format.js { render js: 'alert("Invalid booking status.");' }
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
      redirect_to profile_path(current_user), notice: 'Booking request sent.'
    else
      redirect_to product_path(@booking.product), notice: 'Booking request could not be sent.'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
