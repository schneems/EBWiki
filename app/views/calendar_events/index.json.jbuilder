json.array!(@calendar_events) do |event|
  json.extract! event, :id, :title, :description, :start_time, :end_time
  json.url calendar_event_url(event, format: :json)
end