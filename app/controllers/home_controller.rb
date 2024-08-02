class HomeController < ApplicationController
  def index
    @directions = Direction.all
    @buses = Bus.all  
  end

  def search
    @direction = Direction.where(source:params[:source],destination:params[:destination]).pluck(:id)
    @buses = Bus.where("direction_id = ?",@direction)
  end

end
