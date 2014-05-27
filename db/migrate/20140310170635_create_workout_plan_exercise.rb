class CreateWorkoutPlanExercise < ActiveRecord::Migration
  def change
    create_table :exercises_workout_plan , :id => false do |t|
      t.integer :workout_plan_id
      t.integer :exercise_id
    end
    add_index :exercises_workout_plan ,["workout_plan_id","exercise_id"]
  end
end
