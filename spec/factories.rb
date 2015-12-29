FactoryGirl.define do
  factory :achievement do
    category "content"
    description { Faker::Lorem.paragraph }
    title { Faker::Lorem.word }
    user_id 1
  end

  factory :user do
    email { Faker::Internet.email }
    github_username { Faker::Internet.email }
    name { Faker::Name.first_name }
    points 0
  end

  factory :update_user do
    description { Faker::Lorem.sentence }
    facebook_username "hello"
    twitter_username "hello"
  end
end
