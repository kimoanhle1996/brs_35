User.create!(fullname:  "Example User",
             email: "example@railstutorial.org",
             password: "foobar",
             password_confirmation: "foobar",
             role: true,
             active: true)

99.times do |n|
  fullname  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(fullname:  fullname,
               email: email,
               password: password,
               password_confirmation: password,
               role: true,
               active: true)
end

