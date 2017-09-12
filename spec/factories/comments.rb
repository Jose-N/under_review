FactoryGirl.define do
  factory :comment do
    body "#{Faker::Lovecraft.sentence}"
  end

  trait :test do
    body "this is a test"
  end

  trait :min do
    body nil
  end
end
