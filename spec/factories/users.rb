FactoryBot.define do
    factory :user do
        name { "name" }
        email { "email@email.com" }
        password { "12345678" }
        password_confirmation { "12345678" }
      end
  end