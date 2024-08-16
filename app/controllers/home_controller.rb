class HomeController < ApplicationController
  def index 
  end

  def show
    direction_id = Direction.where(source: params[:source], destination: params[:destination]).pluck(:id)
    @buses = Bus.where("direction_id = ?",direction_id)
  end
  
end
