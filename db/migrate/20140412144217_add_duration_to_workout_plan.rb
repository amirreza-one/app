class AddDurationToWorkoutPlan < ActiveRecord::Migration
  def change
    add_column :workout_plans, :duration, :time
  end
end
