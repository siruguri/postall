require 'factory_girl'

FactoryGirl.define do

  factory :user do |u|
    u.name                   "Test User that loves beer"
    sequence(:email) { |i| "user_#{i}@example.com"}
    u.password               "draft1"
    u.password_confirmation  "draft1"
    u.subscribe               true
    u.admin                   false
  end

  factory :admin, class: User do |u|
    u.name                   "this is an admin"
    u.email                  "light1@test.railsschool.org"
    u.password               "draft1"
    u.password_confirmation  "draft1"
    admin                    true
  end


end
