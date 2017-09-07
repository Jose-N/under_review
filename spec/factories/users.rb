FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "{Faker::Lovecraft.deity}#{n}@#{Faker::Lovecraft.location}.com" }
    first_name 'Jane'
    last_name 'Doe'
    password "#{Faker::Lovecraft.word}#{Faker::Lovecraft.word}"
  end
end
