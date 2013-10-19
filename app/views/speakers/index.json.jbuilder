json.array!(@speakers) do |speaker|
  json.extract! speaker, :first_name, :last_name, :url, :slides, :past_talks, :location
  json.url speaker_url(speaker, format: :json)
end
