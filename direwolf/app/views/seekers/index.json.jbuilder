json.array!(@seekers) do |seeker|
  json.extract! seeker, :id
  json.url seeker_url(seeker, format: :json)
end
