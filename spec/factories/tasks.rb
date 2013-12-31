FactoryGirl.define do
  sequence :task_title do |n|
    "This is Task #{n}"
  end

  factory :task do
    task_title
  end
end
