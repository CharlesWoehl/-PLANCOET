class AddCategoryReferencesToActualities < ActiveRecord::Migration[7.1]
  def change
    add_reference :actualities, :category, null: false, foreign_key: true
  end
end
