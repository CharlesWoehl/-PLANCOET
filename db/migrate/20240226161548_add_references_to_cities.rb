class AddReferencesToCities < ActiveRecord::Migration[7.1]
  def change
    add_reference :cities, :category, foreign_key: true

  end
end
