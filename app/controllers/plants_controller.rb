class PlantsController < ApplicationController
  def index
    @plants = Plant.order(:common_name)
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def search
    @query = params[:query]
    @plants = Plant.where('common_name LIKE ? OR scientific_name LIKE ?', "%#{@query}%", "%#{@query}%")
  end
end
