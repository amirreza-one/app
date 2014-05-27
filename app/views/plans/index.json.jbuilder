json.array!(@plans) do |plan|
  json.extract! plan, :id, :total_cal, :total_protein, :total_carbohydrate, :total_fat
  json.url plan_url(plan, format: :json)
end
