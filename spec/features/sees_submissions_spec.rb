require 'rails_helper'

feature "sees submissions" do
  scenario "see all the submissions" do
    submission = FactoryGirl.create(:submission)
    another_submission = FactoryGirl.create(:submission, :full)

    visit submissions_path
    expect(page).to have_content(submission.title)
    expect(page).to have_content(another_submission.title)
  end
end
