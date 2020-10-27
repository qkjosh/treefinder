class GeneraController < ApplicationController
  def index
    @genera = Genus.order(:name).order(:name)
  end

  def show
    @genus = Genus.find(params[:id])
  end
end
