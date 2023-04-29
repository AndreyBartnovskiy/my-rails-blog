FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    email { Faker::Internet.email }
    password { "password" }

    trait :admin do
      role { :admin }
    end
  end
end
