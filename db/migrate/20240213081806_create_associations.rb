class CreateAssociations < ActiveRecord::Migration[7.1]
  def change
    create_table :associations do |t|
      t.string :name
      t.string :short_description
      t.text :resume
      t.string :president
      t.string :phone_president
      t.string :mail_president
      t.string :referent
      t.string :phone_referent
      t.string :mail_referent
      t.string :facebook
      t.string :instagram
      t.string :website
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
