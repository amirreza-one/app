class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.integer :height
      t.integer :weight
      t.string :country
      t.string :city
      t.integer :role

      t.timestamps
    end
  end
end
