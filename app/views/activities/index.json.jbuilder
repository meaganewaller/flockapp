json.array!(@activities) do |activity|
  json.extract! activity, :name, :description, :alcohol
  json.url activity_url(activity, format: :json)
end
