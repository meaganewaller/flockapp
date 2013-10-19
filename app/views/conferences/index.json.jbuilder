json.array!(@conferences) do |conference|
  json.extract! conference, :name, :start_date, :end_date, :location, :category, :safety_policty, :childcare
  json.url conference_url(conference, format: :json)
end
