FactoryGirl.define do
  factory :user do
    email 'sameer@sameer.me'
    password 'sameer123'
    password_confirmation 'sameer123'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
