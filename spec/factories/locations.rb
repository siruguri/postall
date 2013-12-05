# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    lat 1.5
    long 1.5
    name "MyString"
    address "MyString"
  end
end
