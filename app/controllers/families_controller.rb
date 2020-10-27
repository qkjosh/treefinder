class FamiliesController < ApplicationController
  def index
    @families = Family.order(:name)
  end

  def show
    @family = Family.find(params[:id])
  end
end
