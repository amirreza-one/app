json.array!(@foods) do |food|
  json.extract! food, :id, :name, :calory, :protein, :carbohydrate, :fat, :amount_type_id, :per
  json.url food_url(food, format: :json)
end
