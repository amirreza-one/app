json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :name, :type, :description, :description_fa, :level, :equipment_id, :days_per_week
  json.url exercise_url(exercise, format: :json)
end
