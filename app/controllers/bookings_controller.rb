class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @booking = Booking.new
    @booking.tickets.build
  end

  def show
    @booking = Booking.find(params[:id])
    @tickets = Ticket.where(booking_id: params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    last_seat = get_last_seat
    @booking.save
    seat_allocate(last_seat)
    BookingMailer.booking_email(current_user).deliver_later

    redirect_to @booking
  end

  def destroy
    @booking = Booking.find(params[:id])

    manage_cancel_tickets

    @booking.destroy
    redirect_to allbookings_path(user_id: current_user.id)
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :date, :mode_type, :bookingable_type, :bookingable_id,
                                    tickets_attributes: %i[name age gender])
  end

  def get_last_seat
    bookingable_type = @booking.bookingable_type
    bookingable_id = @booking.bookingable_id
    last_booking_id = nil

    case bookingable_type
    when 'Bus'
      last_booking = Bus.find(bookingable_id).bookings.last
      last_booking_id = last_booking&.id

    when 'Train'
      last_booking = Train.find(bookingable_id).bookings.last
      last_booking_id = last_booking.nil? ? nil : last_booking.id

    when 'Flight'
      last_booking = Flight.find(bookingable_id).bookings.last
      last_booking_id = last_booking.nil? ? nil : last_booking.id

    end

    if last_booking_id.nil?
      0

    else
      Booking.find(last_booking_id).tickets.last.seat_no
    end
  end

  def seat_allocate(last_seat)
    last_seat = 0 if last_seat.nil?

    tickets = @booking.tickets

    tickets.each do |ticket|
      last_seat += 1
      ticket.update_columns(seat_no: last_seat)
      if @booking.bookingable_type.eql? 'Bus'
        bus = Bus.find(@booking.bookingable_id)
        bus.update_columns(remaning_seats: bus.remaning_seats - 1)

      elsif @booking.bookingable_type.eql? 'Train'
        train = Train.find(@booking.bookingable_id)
        train.update_columns(remaning_seats: train.remaning_seats - 1)

      else
        flight = Flight.find(@booking.bookingable_id)
        flight.update_columns(remaning_seats: flight.remaning_seats - 1)

      end
    end
  end

  def manage_cancel_tickets
    ticket_count = @booking.tickets.count

    if @bookingable_type.eql? 'Bus'
      bus = Bus.find_by(id: @booking.bookingable_id)
      bus.update_columns(remaning_seats: bus.remaning_seats + ticket_count)

    elsif @booking.bookingable_type.eql? 'Train'
      train = Train.find_by(id: @booking.bookingable_id)
      train.update_columns(remaning_seats: train.remaning_seats + ticket_count)

    else
      flight = Flight.find_by(id: @booking.bookingable_id)
      flight.update_columns(remaning_seats: flight.remaning_seats + ticket_count)
    end
  end
end
