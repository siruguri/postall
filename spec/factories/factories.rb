require 'factory_girl'

FactoryGirl.define do

  factory :user do |u|
    sequence(:email) { |i| "user_#{i}@example.com"}
    u.password               "admin123"
    u.password_confirmation  "admin123"
    u.admin                   false
  end

  factory :admin, class: User do |u|

    u.email                  "light1@test.railsschool.org"
    u.password               "admin123"
    u.password_confirmation  "admin123"
    admin                    true
  end

end
