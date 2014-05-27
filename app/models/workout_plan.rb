class WorkoutPlan < ActiveRecord::Base
  has_many :workout_includings
  has_many :exercises, :through => :workout_includings
end
