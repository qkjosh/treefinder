class ParksController < ApplicationController
  def index
    @parks = Park.order(:name)
  end

  def show
    @park = Park.find(params[:id])
    @plants = ParkPlant.where(park_id: params[:id])
  end
end
