class CreatePlansFoods < ActiveRecord::Migration
  def change
    create_table :foods_plans , :id => false do |t|
      t.integer :plan_id
      t.integer :food_id
    end
    add_index :foods_plans , ["plan_id","food_id"]
  end
end
