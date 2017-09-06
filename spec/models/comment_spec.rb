require 'rails_helper'

RSpec.describe Comment, type: :model do

  context "#body" do
    it { should have_valid(:body).when('Awesome Cat Review', "I didn't know bikes had two wheels")}
  end

  context "#associations" do
    it { should belong_to :user }
    it { should have_one :rating}
  end
end
