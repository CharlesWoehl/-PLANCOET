class AssociationsController < ApplicationController
  def index
    @associations = if params.dig(:filter, :category).present?
                      category = Category.find_by(name: params[:filter][:category])
                      category.present? ? category.associations.order(:name) : Association.none
                    else
                      Association.all.order(:name)
                    end

    # Filtrer les catégories en fonction de la présence d'associations
    @categories_with_associations = Category.joins(:associations).distinct.order(:name)
  end

  def show
    @association = Association.find(params[:id])
  end
end
