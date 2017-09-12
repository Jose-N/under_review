FactoryGirl.define do
  factory :comment do
    body "#{Faker::Lovecraft.sentence}"
    troll 1
    funny 1
    story 1
    helpful 1
  end

  trait :test do
    body "this is a test"
    troll 1
    funny 1
    story 1
    helpful 1
  end

  trait :min do
    body nil
    troll 1
    funny 1
    story 1
    helpful 1
  end
end
