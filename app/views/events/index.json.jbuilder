json.array! @events do |event|
  json.title event.title
  json.description event.description	
  json.start event.start_time
  json.end  event.end_time
  json.id   event.id
  json.url  event_path(event)
end