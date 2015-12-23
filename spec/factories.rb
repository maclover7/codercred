FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.first_name }
    username { Faker::Internet.email }
  end
end
