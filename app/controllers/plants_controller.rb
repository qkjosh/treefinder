class PlantsController < ApplicationController
  def index
    @plants = Plant.order(:name).order(:common_name)
  end

  def show
    @plant = Plant.find(params[:id])
  end
end
