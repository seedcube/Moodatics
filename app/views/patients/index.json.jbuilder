json.array!(@patients) do |patient|
  json.extract! patient, :first_name, :last_name, :middle_name, :email, :doctor_id, :role_id
  json.url patient_url(patient, format: :json)
end
