Fabricator(:user) do
  first_name { sequence(:first_name) { |i| "user#{i}" } }
  last_name { sequence(:last_name) { |i| "user#{i}" } }
  email { sequence(:email) { |i| "user#{i}@example.com" } }
  password 'password'
  producer true
  # songs(count: 2)
end
