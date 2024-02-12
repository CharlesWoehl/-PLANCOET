class CreateActualities < ActiveRecord::Migration[7.1]
  def change
    create_table :actualities do |t|
      t.string :title
      t.string :short_description
      t.text :content
      t.date :date
      t.boolean :activate, default: false
      t.timestamps
    end
  end
end
