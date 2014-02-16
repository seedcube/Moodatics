json.array!(@users) do |user|
  json.extract! user, :first_name, :last_name, :middle_name, :email, :password_digest, :role_id
  json.url user_url(user, format: :json)
end
