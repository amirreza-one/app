class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :total_cal
      t.float :total_protein
      t.float :total_carbohydrate
      t.float :total_fat
      t.timestamps
    end
  end
end
