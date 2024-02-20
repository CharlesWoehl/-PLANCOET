class CitiesController < ApplicationController
  def index
    @cities = City.all.order(:name)
  end
end
