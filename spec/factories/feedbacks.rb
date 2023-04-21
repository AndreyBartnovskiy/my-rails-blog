FactoryBot.define do
  factory :feedback do
    name { "John" }
    email { Faker::Internet.email }
    message { "Hello, admin!" }
  end
end
