class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.string :period
      t.integer :count

      t.timestamps
    end
  end
end
