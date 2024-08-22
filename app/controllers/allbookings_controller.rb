class AllbookingsController < ApplicationController
  def index
    
  end
  def show
    @bookings = Booking.where(user_id:params[:user_id])
  end

  def showtickets
    booking_id = params[ :booking_id ]
    @data = Hash.new
    direction_id = nil 
    @tickets = Ticket.where( booking_id: booking_id )

    bookingable_type = Booking.find_by( id: booking_id ).bookingable_type
    bookingable_id = Booking.find_by( id: booking_id ).bookingable_id
    @data[ :Mode_type ] = bookingable_type

    if(bookingable_type.eql?"Bus")
      bus = Bus.find_by( id: bookingable_id )
      @data[ :Bus_name ] = bus.name
      @data[ :Departure_Time ] = bus.departure_time.to_fs( :time )
      @data[ :Arrival_Time ] = bus.arrival_time.to_fs( :time )
      @data[ :Type ] = bus.bustype
      @data[ :Price ] = bus.price*@tickets.count
      direction_id = bus.direction_id

    elsif(bookingable_type.eql?"Train")
      train = Train.find_by( id: bookingable_id )
      @data[ :Train_Name ] = train.name
      @data[ :Departure_Time ] = train.departure_time.to_fs( :time )
      @data[ :Arrival_Time ] = train.arrival_time.to_fs( :time )
      @data[ :Type ] = train.traintype
      @data[ :Price ] = train.price*@tickets.count
      direction_id = train.direction_id
    
    else
      flight = Flight.find_by( id: bookingable_id )
      @data[ :Flight_Name ] = flight.name
      @data[ :Departure_Time ] = flight.departure_time.to_fs( :time )
      @data[ :Arrival_Time ] = flight.arrival_time.to_fs( :time )
      @data[ :Price ] = flight.price*@tickets.count
      direction_id = flight.direction_id

    end

    direction = Direction.find_by( id: direction_id )
    @data[ :Source ] = direction.source
    @data[ :Destination ] = direction.destination
    @data[ :Distance ] = direction.distance 

  end

end
