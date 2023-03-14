FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    confirmed_at { Time.zone.now }
  end
end
