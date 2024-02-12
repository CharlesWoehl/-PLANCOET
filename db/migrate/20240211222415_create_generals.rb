class CreateGenerals < ActiveRecord::Migration[7.1]
  def change
    create_table :generals do |t|
      t.string :title
      t.text :subtitle
      t.timestamps
    end
  end
end
