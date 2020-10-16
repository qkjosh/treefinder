class ParksController < ApplicationController
  def index
    @parks = Park.order(:name)
  end

  def show
    @park = Park.find(params[:id])
  end
end
