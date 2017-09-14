FactoryGirl.define do
  factory :submission do
    title "Not stunting in my Air Force Ones"
    screenshot { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'test_submission_image.jpeg'), 'image/jpeg') }
    troll 1
    funny 1
    story 1
    helpful 1
  end

  trait :full do
    description "I am a potato"
    url "www.test.com"
    troll 1
    funny 1
    story 1
    helpful 1
  end

  trait :invalid do
    title nil
    screenshot nil
    troll nil
    funny nil
    story nil
    helpful nil
  end
end
