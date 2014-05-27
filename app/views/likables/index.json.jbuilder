json.array!(@likables) do |likable|
  json.extract! likable, :id, :user_id, :photo_event_id
  json.url likable_url(likable, format: :json)
end
