class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :referent
      t.string :email
      t.string :phone
      t.string :phone_2
      t.string :website
      t.text :infos
      t.timestamps
    end
  end
end
