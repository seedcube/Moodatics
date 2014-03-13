FactoryGirl.define do
  factory :user do
    first_name 'Test'
    last_name 'User' 
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme' 
    role_id '1'
  end
end