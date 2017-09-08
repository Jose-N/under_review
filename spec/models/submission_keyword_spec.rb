require 'rails_helper'

RSpec.describe SubmissionKeyword, type: :model do
  context "#submission_kewords" do
    it { should have_valid(:submission_id).when(1, 3, 5)}
    it { should_not have_valid(:submission_id).when(nil, "")}

    it { should have_valid(:keyword_id).when(1, 3, 5)}
    it { should_not have_valid(:keyword_id).when(nil, "")}
  end

  context "#associations" do
    it { should belong_to :submission}
    it { should belong_to :keyword}
  end
end
