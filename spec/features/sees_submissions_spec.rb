require 'rails_helper'

feature "sees submissions" do
  scenario "see all the submissions" do
    greg = FactoryGirl.create(:user)

    submission = FactoryGirl.create(:submission, user: greg)
    another_submission = FactoryGirl.create(:submission, :full, user: greg)

    visit submissions_path
    expect(page).to have_link(submission.title)
    expect(page).to have_link(another_submission.title)
  end
end
