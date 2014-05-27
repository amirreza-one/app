json.array!(@workout_plans) do |workout_plan|
  json.extract! workout_plan, :id, :name
  json.url workout_plan_url(workout_plan, format: :json)
end
