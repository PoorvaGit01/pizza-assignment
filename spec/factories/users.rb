FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { "password123" }
      role { :customer } # Default role
    end
  end
  