class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.save
  end    

  private
  def ticket_params
    params.require(:ticket).permit(:seat_no,:name,:age,:gender,:booking_id)
  end
end
