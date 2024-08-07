class BookingsController < ApplicationController
 
  def new
   @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      manage_ticket
    end
  end       

  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:first_name,:last_name,:age,:gender,:user_id,:date,:mode_type,:bus_id)
  end
 
  def manage_ticket
    seat_no = (Ticket.last.seat_no) + 1
    @remaning_seet = Bus.find_by(id: @booking.bus_id).total_seets - seat_no
    @ticket = Ticket.create(seat_no: seat_no, bus_id: @booking.bus_id, booking_id: @booking.id)
    redirect_to booking_path(@booking)
  end
end
