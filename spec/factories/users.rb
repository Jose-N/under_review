FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@#{Faker::Lovecraft.location}.com" }
    sequence(:username) { |n| "#{Faker::Number.number(15)}" }
    first_name 'Jane'
    last_name 'Doe'
    password "#{Faker::Lovecraft.word}#{Faker::Lovecraft.word}"
  end

  trait :admin do
    admin true
  end
end
