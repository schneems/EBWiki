json.array!(@calendar_events) do |event|
  json.extract! event, :id, :title, :description
  json.start event.start_time
  json.end event.end_time
  json.url calendar_event_url(event, format: :html)

  json.update_url calendar_event_path(event, method: :patch)
  json.edit_url edit_calendar_event_path(event)
end