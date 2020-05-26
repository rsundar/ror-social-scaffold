require 'faker'

FactoryBot.define do
  factory :user, aliases: [:friend] do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
  end
end

FactoryBot.define do
  factory :friendship do
    user
    friend
    
    trait :pending do
      status { "pending" }
    end

    trait :requested do
      status { "requested" }
    end

    trait :accepted do
      status { "accepted" }
    end
  end
end