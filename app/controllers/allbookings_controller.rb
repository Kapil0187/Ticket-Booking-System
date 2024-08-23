class AllbookingsController < ApplicationController
  def index
    
  end
  def show
    @bookings = Booking.where( user_id: params[:user_id] )
  end

end
