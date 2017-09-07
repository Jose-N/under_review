require 'rails_helper'

RSpec.describe Comment, type: :model do

  context "#body" do
    it { should have_valid(:body).when('Awesome Cat Review', "I didn't know bikes had two wheels")}
    it { should_not have_valid(:body).when(nil, '')}
  end

  context "#associations" do
    # it { should belong_to :user }
    it { should belong_to :submission }
    it { should have_one :rating}
  end
end
