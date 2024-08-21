class AllbookingsController < ApplicationController
  def index
    
  end
  def show
    @bookings = Booking.where(user_id:params[:user_id])
  end

  def showtickets
    @tickets = Ticket.where(booking_id:params[:booking_id])
  end

end
