require 'rails_helper'

RSpec.describe Rating, type: :model do
  context "#ratings" do
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
    it { should belong_to :comment}
    # it { should belong_to :user}

  end
end
