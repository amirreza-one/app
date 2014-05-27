class CreateTakingFoodPlans < ActiveRecord::Migration
  def change
    create_table :taking_food_plans do |t|
      t.references :plan
      t.references :profile
      t.string :summary
      t.date :start_time
      t.date :end_time
      t.timestamps
    end
    add_index :taking_food_plans , ["plan_id","profile_id"]
  end
end
