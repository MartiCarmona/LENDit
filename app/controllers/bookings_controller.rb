class BookingsController < ApplicationController
  before_action :authenticate_user!
<<<<<<< HEAD
=======
  # before_action :set_booking, only: [:edit, :update, :destroy]
  def index
    @pending_lend_requests = Booking.where(status: 'pending_lend')
    @accepted_lend_requests = Booking.where(status: 'accepted_lend')
    @declined_lend_requests = Booking.where(status: 'declined_lend')

    @pending_borrow_requests = Booking.where(status: 'pending_borrow')
    @accepted_borrow_requests = Booking.where(status: 'accepted_borrow')
    @declined_borrow_requests = Booking.where(status: 'declined_borrow')
  end

>>>>>>> 7b776bfe184d310b18ad9bb5b4add52c8f34bf19

  def new
    @booking = Booking.new
    @booking.user = current_user
    @booking.product = Product.find(params[:event_id])
  end

<<<<<<< HEAD
=======

>>>>>>> 7b776bfe184d310b18ad9bb5b4add52c8f34bf19
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.product = Product.find(params[:product_id])
    @booking.status = 'pending_lend'

    if @booking.save
      redirect_to profile_path(current_user), notice: 'Booking request sent.'
    else
      redirect_to product_path(@booking.product), notice: 'Booking request could not be sent.'
    end
  end

  def accept
    @booking.update(status: 'accepted_lend') if @booking.status == 'pending_lend'
    @booking.update(status: 'accepted_borrow') if @booking.status == 'pending_borrow'
    redirect_to bookings_path, notice: 'Booking request accepted.'
  end

  def decline
    @booking.update(status: 'declined_lend') if @booking.status == 'pending_lend'
    @booking.update(status: 'declined_borrow') if @booking.status == 'pending_borrow'
    redirect_to bookings_path, notice: 'Booking request declined.'
  end

  def pending_lend
    @pending_lend_requests = Booking.where(status: 'pending_lend')
  end

  def accepted_lend
    @accepted_lend_requests = Booking.where(status: 'accepted_lend')
  end

  def declined_lend
    @declined_lend_requests = Booking.where(status: 'declined_lend')
  end

  def pending_borrow
    @pending_borrow_requests = Booking.where(status: 'pending_borrow')
  end

  def accepted_borrow
    @accepted_borrow_requests = Booking.where(status: 'accepted_borrow')
  end

  def declined_borrow
    @declined_borrow_requests = Booking.where(status: 'declined_borrow')
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end


  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
