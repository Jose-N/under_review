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

feature "user can see comments on page" do
  scenario "user goes to show page for a submission for comments" do
    min_submission = FactoryGirl.create(:submission)
    first_comment = FactoryGirl.create(:comment, submission_id: min_submission.id)

    visit submission_path(min_submission)
    expect(page).to have_content(first_comment.body)
  end
end


feature "user can see ratings on show page" do
  scenario "user goes to show page for a submission" do
    min_submission = FactoryGirl.create(:submission)
    first_comment = FactoryGirl.create(:comment, submission_id: min_submission.id)
    first_rating = FactoryGirl.create(:rating, submission_id: min_submission.id, comment_id: first_comment.id)


    visit submission_path(min_submission)
    expect(page).to have_content(first_rating.troll)
    expect(page).to have_content(first_rating.funny)
    expect(page).to have_content(first_rating.story)
    expect(page).to have_content(first_rating.helpful)
  end
end
