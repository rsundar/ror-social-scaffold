require 'faker'

FactoryBot.define do
  factory :user, aliases: [:friend] do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
  end
end

FactoryBot.define do
  factory :post do
    user
    content { Faker::Quote.matz }
    created_at { Time.zone.now }

    trait :old do
      created_at { Time.zone.now - rand(365).days }
    end
  end
end

FactoryBot.define do
  factory :comment do
    user
    post
    content { Faker::Quote.matz }
    created_at { Time.zone.now }
  end
end