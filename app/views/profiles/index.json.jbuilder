json.array!(@profiles) do |profile|
  json.extract! profile, :id, :firstname, :lastname, :birthdate, :height, :weight, :country, :city, :role
  json.url profile_url(profile, format: :json)
end
