class FlightsController < ApplicationController
  def index
  end

  def show_flight
    direction_id = Direction.where(source: params[:source], destination: params[:destination]).pluck(:id)
    @flights = Flight.where("direction_id = ?",direction_id)
  end
end
