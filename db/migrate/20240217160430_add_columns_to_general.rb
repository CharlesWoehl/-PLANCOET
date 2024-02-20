class AddColumnsToGeneral < ActiveRecord::Migration[7.1]
  def change
    add_column :generals, :legal_notice, :text
    add_column :generals, :about, :text
  end
end
