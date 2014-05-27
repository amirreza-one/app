class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :part
      t.text :description
      t.text :description_fa
      t.integer :level
      t.references :equipment, index: true
      t.integer :days_per_week

      t.timestamps
    end
  end
end
