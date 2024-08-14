class BookingsController < ApplicationController
 
  def new
   @booking = Booking.new
   @booking.tickets.build
  end

  def show
    @booking = Booking.find(params[:id])
  end
  
  def create
    @booking = Booking.new(booking_params)
    last_seat = get_last_seat
    @booking.save
    manage_ticket(last_seat)
    redirect_to @booking
  end       

  private
  def booking_params
    params.require(:booking).permit(:user_id,:date,:mode_type,:bus_id,tickets_attributes:[:name,:age,:gender])
  end
 
  def get_last_seat
    bus_id = @booking.bus_id
    last_booking = Bus.find(bus_id).booking.last
    last_booking_id = last_booking == nil ? nil : last_booking.id
    
    if(last_booking_id==nil)
      return 0
    else
      last_seat_no = Booking.find(last_booking_id).tickets.last.seat_no
      return last_seat_no
    end
  end

  def manage_ticket(last_seat)
    if(last_seat==nil)
      last_seat = 0
    end
    tickets = @booking.tickets
    tickets.each do |ticket|
      last_seat += 1
      ticket.update_columns(seat_no: last_seat)
    end
  end
end
