class AssociationsController < ApplicationController
  def index
    if params.dig(:filter, :category).present?
      category = Category.find_by(name: params[:filter][:category])
      @associations = category.present? ? category.associations.order(:name) : Association.none
    else
      @associations = Association.all.order(:name)
    end

    # Filtrer les catégories en fonction de la présence d'associations
    @categories_with_associations = Category.joins(:associations).distinct.order(:name)
  end

  def show
    @association = Association.find(params[:id])
  end
end
