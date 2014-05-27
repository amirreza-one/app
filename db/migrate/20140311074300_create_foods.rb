class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calory
      t.float :protein
      t.float :carbohydrate
      t.float :fat
      t.references :amount_type, index: true
      t.float :per

      t.timestamps
    end
  end
end
