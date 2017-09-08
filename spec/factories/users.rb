FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@#{Faker::Lovecraft.location}.com" }
    first_name 'Jane'
    last_name 'Doe'
    username "#{Faker::Hipster.word}#{Faker::Lovecraft.deity}"
    password "#{Faker::Lovecraft.word}#{Faker::Lovecraft.word}"
  end
end
