FactoryGirl.define do
  factory :submission do
    title "Not stunting in my Air Force Ones"
    screenshot { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'test_submission_image.jpeg'), 'image/jpeg') }
  end

  trait :full do
    url "www.test.com"
  end

  trait :invalid do
    title nil
    screenshot nil
  end
end
