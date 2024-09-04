class AllbookingsController < ApplicationController
  def index
    
  end
  def show
    @bookings = Booking.where([ "user_id = ? and date >= ?",params[:user_id], Date.today()])
  end

  def history
    @bookings = Booking.where([ "user_id = ? and date < ?",params[:user_id], Date.today()])
  end
end
