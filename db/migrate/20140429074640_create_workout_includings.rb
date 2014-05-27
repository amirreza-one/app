class CreateWorkoutIncludings < ActiveRecord::Migration
  def change
    create_table :workout_includings do |t|
      t.integer :workout_plan_id , index: true
      t.integer :exercise_id , index: true
      t.integer :duration , :default => 15
      t.integer :reps , :default => 10

      t.timestamps
    end
  end
end
