json.array!(@amount_types) do |amount_type|
  json.extract! amount_type, :id, :name
  json.url amount_type_url(amount_type, format: :json)
end
