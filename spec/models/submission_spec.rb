require 'rails_helper'

RSpec.describe Submission, type: :model do

  context "#submission" do
    it {should have_valid(:title).when("Warning this thing is hot")}
    it {should_not have_valid(:title).when(nil, "")}

    it {should have_valid(:user_id).when(1)}
    it {should_not have_valid(:user_id).when(nil, "")}

    it {should have_valid(:description).when("Crazy lady sets sofa on fire")}
    it {should have_valid(:description).when(nil, "")}


    it {should have_valid(:url).when(nil, "")}
    it {should have_valid(:url).when("www.example.com")}
  end

  context "associations" do
    it { should have_many :comments}
    it { should have_many :ratings}
  end
end
