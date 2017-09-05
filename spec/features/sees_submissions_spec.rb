require 'rails_helper'

feature "sees submissions" do
  scenario "see all the submissions" do
    submission = Submission.create(title: "Not stunting in my Air Force Ones", user_id: 1)
    another_submission = Submission.create(title: "This product caused my divorce", user_id: 1)

    visit submissions_path
    expect(page).to have_content(submission.title)
    expect(page).to have_content(another_submission.title)
    
  end
end
