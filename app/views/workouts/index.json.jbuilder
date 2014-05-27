json.array!(@workouts) do |workout|
  json.extract! workout, :id, :user_id, :workout_plan_id, :date, :total_min, :total_cal
  json.url workout_url(workout, format: :json)
end
