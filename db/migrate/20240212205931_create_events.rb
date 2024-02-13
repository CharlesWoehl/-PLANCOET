class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.date :start_date
      t.date :end_date
      t.string :hourly_start
      t.string :hourly_end
      t.string :place
      t.string :contact
      t.string :email
      t.string :phone
      t.string :website
      t.references :category, null: false, foreign_key: true
      t.boolean :display, default: false
      t.timestamps
    end
  end
end
