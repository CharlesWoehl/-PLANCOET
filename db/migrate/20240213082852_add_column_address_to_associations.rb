class AddColumnAddressToAssociations < ActiveRecord::Migration[7.1]
  def change
    add_column :associations, :address, :string
  end
end
