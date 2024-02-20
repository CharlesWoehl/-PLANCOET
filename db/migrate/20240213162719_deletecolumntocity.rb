class Deletecolumntocity < ActiveRecord::Migration[7.1]
  def change
     remove_column :cities, :referent, :string
    remove_column :cities, :email, :string
    remove_column :cities, :phone, :string
    remove_column :cities, :phone_2, :string

  end
end
