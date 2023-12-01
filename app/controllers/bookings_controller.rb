class BookingsController < ApplicationController
  before_action :authenticate_user!


  def show
    @booking = Booking.find(params[:id])
    @product = @booking.product
    @user = @booking.user
    render layout: "with_sidebar"
  end

  def lends
    @pending_lend_requests = current_user.received_bookings.where(status: 'pending')
    @accepted_lend_requests = current_user.received_bookings.upcoming
    @finished_lend_requests = current_user.received_bookings.finished
    @ongoing_lend_requests = current_user.received_bookings.ongoing

    render layout: 'with_sidebar'
  end

  def borrows
    @pending_borrow_requests = current_user.bookings.where(status: 'pending')
    @accepted_borrow_requests = current_user.bookings.where(status: 'accepted')
    @finished_borrow_requests = current_user.bookings.where(status: 'finished')
    @ongoing_borrow_requests = current_user.bookings.where(status: 'ongoing').where('end_date >= ? and start_date <= ?', Date.today, Date.today)

    render layout: 'with_sidebar'
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.status == 'pending'

      if @booking.start_date > Date.today
        @booking.update(status: 'accepted')
      elsif @booking.start_date <= Date.today && @booking.end_date >= Date.today
        @booking.update(status: 'ongoing')
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
      redirect_to profile_path(current_user), notice: 'Booking request sent.'
    else
      redirect_to product_path(@booking.product), notice: 'Booking request could not be sent.'
    end
  end

  def cancel
    @booking = Booking.find(params[:id])

    @booking.destroy

    redirect_to lends_bookings_path, notice: 'Booking request canceled.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
