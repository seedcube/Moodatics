json.array!(@doctors) do |doctor|
  json.extract! doctor, :name
  json.url doctor_url(doctor, format: :json)
end
