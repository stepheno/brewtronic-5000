Fabricator(:user) do 
  email { sequence(:email) { |i| "user#{i}@example.com" } }
  password 'blehthrowupinmymouth'
end
