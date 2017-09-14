User.create!(fullname:  "kimoanh",
             email: "kimoanhle1996@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             role: true,
             active: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  fullname  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(fullname:  fullname,
               email: email,
               password: password,
               password_confirmation: password,
               role: false,
               active: true,
               activated: true,
               activated_at: Time.zone.now)
end

Catagory.create!(
    name: "C++"
  )
Catagory.create!(
    name: "Android"
  )
Catagory.create!(
    name: "PHP"
  )
Catagory.create!(
    name: "Java"
  )
Catagory.create!(
    name: "Ruby on Rails"
  )
Catagory.create!(
    name: "IOS"
  )
