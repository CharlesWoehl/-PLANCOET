class CitiesController < ApplicationController
  def index
    @cities = if params.dig(:filter, :category).present?
                      category = Category.find_by(name: params[:filter][:category])
                      category.present? ? category.cities.order(:name) : City.none
                    else
                      City.all.order(:name)
                    end

     @categories_with_cities = Category.joins(:cities).distinct.order(:name)
  end
end
