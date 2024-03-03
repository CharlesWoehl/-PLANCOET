class AddCountToUniqueVisits < ActiveRecord::Migration[7.1]
  def change
    add_column :unique_visits, :count, :integer, default: 0
  end
end
