FactoryGirl.define do
  factory :achievement do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    user_id 1
  end

  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.first_name }
    username { Faker::Internet.email }
  end
end
