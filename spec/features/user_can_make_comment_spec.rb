require 'rails_helper'

feature "user can leave a comment" do

  scenario "successfully makes comment" do
    min_submission = FactoryGirl.create(:submission)

    visit submission_path(min_submission)

    fill_in "User Id", with: 1
    fill_in "Comment", with: "This is so great!"
    click_button "Comment This Jawn"

    expect(page).to have_content(min_submission.title)
    expect(page).to have_css("img[src*='test_submission_image.jpeg']")
    expect(page).to have_content "This is so great!"
  end

  scenario "unsuccessfully makes comment" do
    min_submission = FactoryGirl.create(:submission)

    visit submission_path(min_submission)

    click_button "Comment This Jawn"

    expect(page).to have_content(min_submission.title)
    expect(page).to have_css("img[src*='test_submission_image.jpeg']")
    expect(page).to have_content("Body can't be blank")  
  end
end
