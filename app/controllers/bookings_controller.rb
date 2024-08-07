class BookingsController < ApplicationController
 
  def new
   @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to booking_path(@booking)
  end       

  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:first_name,:last_name,:age,:gender,:user_id,:date,:mode_type)
  end

end
