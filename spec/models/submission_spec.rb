require 'rails_helper'

RSpec.describe Submission, type: :model do

  context "#submission" do
    it {should have_valid(:title).when("Warning this thing is hot")}
    it {should_not have_valid(:title).when(nil, "")}

    it {should have_valid(:user_id).when(1)}
    it {should_not have_valid(:user_id).when(nil, "")}

    it {should have_valid(:url).when(nil, "")}
    it {should have_valid(:url).when("www.example.com")}

    it { should have_valid(:troll).when(1, 3, 5) }
    it { should_not have_valid(:troll).when(nil, '', 0, 95 )}

    it { should have_valid(:funny).when(1, 3, 5) }
    it { should_not have_valid(:funny).when(nil, '', 0, 95 )}

    it { should have_valid(:story).when(1, 3, 5) }
    it { should_not have_valid(:story).when(nil, '', 0, 95 )}

    it { should have_valid(:helpful).when(1, 3, 5) }
    it { should_not have_valid(:helpful).when(nil, '', 0, 95 )}
  end

  context "associations" do
    it { should have_many :comments}
  end
end
