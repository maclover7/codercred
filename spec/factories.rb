FactoryGirl.define do
  factory :achievement do
    category "content"
    description { Faker::Lorem.paragraph }
    title { Faker::Lorem.word }
    user_id 1
  end

  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.first_name }
    username { Faker::Internet.email }
  end
end
