class CreateWorkoutPlans < ActiveRecord::Migration
  def change
    create_table :workout_plans do |t|
      t.string :name
      t.string :difficulty
      t.string :part
      t.string :mode
      t.references :user

      t.timestamps
    end
  end
end
