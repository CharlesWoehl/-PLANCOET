class CreateUniqueVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :unique_visits do |t|
      t.string :user_id
      t.string :period
      t.integer :count, default: 0  # Ajout de l'attribut count avec une valeur par défaut de 0
      t.timestamps
    end
  end
end
