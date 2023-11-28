class BookingsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_booking, only: [:edit, :update, :destroy]

  # GET /bookings/new
  def new
    @booking = Booking.new
    @booking.user = current_user
    @booking.event = Event.find(params[:event_id])
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.product = Product.find(params[:product_id])

    if @booking.save
      redirect_to profile_path(current_user), notice: 'Booking was successfully created.'
    else
      redirect_to product_path(@booking.product), notice: 'Booking could not be created'
    end

    # respond_to do |format|
    #   if @booking.save
    #     format.html { redirect_to @booking.event, notice: 'Booking was successfully created.' }
    #     format.json { render :show, status: :created, location: @booking.event }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @booking.event.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  # def destroy
  #   event = @booking
  #   event.destroy
  #   respond_to do |format|
  #     format.html { redirect_to events_url, notice: 'Booking was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
