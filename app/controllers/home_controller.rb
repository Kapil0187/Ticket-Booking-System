class HomeController < ApplicationController
  def index 
  end

  def search
    direction = Direction.where(source:params[:source],destination:params[:destination]).pluck(:id)
    @buses = Bus.where("direction_id = ?",direction)
  end

end
