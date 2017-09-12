require 'rails_helper'

RSpec.describe Comment, type: :model do

  context "#body" do
    it { should have_valid(:body).when('Awesome Cat Review', "I didn't know bikes had two wheels")}
    it { should have_valid(:body).when(nil, '')}

    it { should have_valid(:troll).when(1, 3, 5) }
    it { should_not have_valid(:troll).when(nil, '', 0, 95 )}

    it { should have_valid(:funny).when(1, 3, 5) }
    it { should_not have_valid(:funny).when(nil, '', 0, 95 )}

    it { should have_valid(:story).when(1, 3, 5) }
    it { should_not have_valid(:story).when(nil, '', 0, 95 )}

    it { should have_valid(:helpful).when(1, 3, 5) }
    it { should_not have_valid(:helpful).when(nil, '', 0, 95 )}
  end

  context "#associations" do
    it { should belong_to :user }
    it { should belong_to :submission }
  end
end
