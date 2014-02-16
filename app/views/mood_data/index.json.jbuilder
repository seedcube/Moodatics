json.array!(@mood_data) do |mood_datum|
  json.extract! mood_datum, :entry_at, :mood, :sleep, :irritability, :anxiety, :comments, :user_id, :doctor_id
  json.url mood_datum_url(mood_datum, format: :json)
end
