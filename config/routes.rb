Rails.application.routes.draw do
  post "/events", to: "events#save_event"
  get "/issues/:issue_number/events", to: "events#get_events_by_issue"


end
