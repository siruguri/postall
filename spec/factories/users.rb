require 'factory_girl'

FactoryGirl.define do
  sequence :sequential_email do |n|
    "user_#{n}@me.com"
  end

  factory :user do 
    factory :admin_user do |u|
      email                  "admin@me.com"
      password               "admin123"
      password_confirmation  "admin123"
      admin true
    end

    factory :ordinary_user do |u|
      email { generate(:sequential_email) } 
      password               "admin123"
      password_confirmation  "admin123"
      admin false
    end
  end
end
