class TrainsController < ApplicationController
  def index
  end

  def show_train
    direction_id = Direction.where(source: params[:source], destination: params[:destination]).pluck(:id)
    @trains = Train.where("direction_id = ?",direction_id)
  end
end
