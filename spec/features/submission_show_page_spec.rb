require 'rails_helper'

feature "see show page for a submission" do

  scenario "user visit minimum submission" do
    min_submission = FactoryGirl.create(:submission)

    visit submission_path(min_submission)

    expect(page).to have_content(min_submission.title)
    expect(page).to have_css("img[src*='test_submission_image.jpeg']")
  end

  scenario "user visit full submission" do
    full_submission = FactoryGirl.create(:submission, :full)

    visit submission_path(full_submission)
    
    expect(page).to have_content(full_submission.title)
    expect(page).to have_content(full_submission.description)
    expect(page).to have_link("Original Review", href: full_submission.url)
    expect(page).to have_css("img[src*='test_submission_image.jpeg']")
  end

end

feature "see show page for a submission" do
  scenario "user can see comments on page" do
    min_submission = FactoryGirl.create(:submission)
    first_comment = FactoryGirl.create(:comment, submission_id: min_submission.id)

    visit submission_path(min_submission)
    expect(page).to have_content(first_comment.body)
  end
end
