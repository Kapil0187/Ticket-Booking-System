class BookingsController < ApplicationController
 
  def index
    
  end
  def new
   @booking = Booking.new
   @booking.tickets.build
  end

  def show
    @booking = Booking.find(params[:id])
    @tickets = Ticket.where(booking_id:params[:id])
  end
  
  def create
    @booking = Booking.new(booking_params)
    last_seat = get_last_seat
    @booking.save
    seat_allocate(last_seat)
    redirect_to @booking
  end       

  private
  def booking_params
    params.require(:booking).permit(:user_id,:date,:mode_type,:bookingable_type,:bookingable_id,tickets_attributes:[:name,:age,:gender])
  end
 
  def get_last_seat
    bookingable_type = @booking.bookingable_type
    bookingable_id = @booking.bookingable_id
    last_booking_id = nil

    if(bookingable_type.eql?"Bus")
      last_booking = Bus.find(bookingable_id).bookings.last
      last_booking_id = last_booking == nil ? nil : last_booking.id

    elsif(bookingable_type.eql?"Train")
      last_booking = Train.find(bookingable_id).bookings.last
      last_booking_id = last_booking == nil ? nil :last_booking.id

    else
      last_booking = Flight.find(bookingable_id).bookings.last
      last_booking_id = last_booking == nil ? nil :last_booking.id

    end

    
    if(last_booking_id==nil)
      return 0

    else
      last_seat_no = Booking.find(last_booking_id).tickets.last.seat_no
      return last_seat_no

    end
    
  end

  def seat_allocate(last_seat)

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
