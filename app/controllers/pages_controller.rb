class PagesController < ApplicationController
  def home
    @parks = Park.order(:name)
  end

  def about
  end
end
