json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :email, :phone_number, :skills, :resume
  json.url profile_url(profile, format: :json)
end
