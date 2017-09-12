require 'rails_helper'

feature "user can leave a rating" do
  scenario "successfully leaves a rating" do
    greg = FactoryGirl.create(:user)
    min_submission = FactoryGirl.create(:submission, user: greg)

    login_as(greg, :scope => :user)

    visit submission_path(min_submission)

    fill_in "Troll", with: "4"
    fill_in "Funny", with: "4"
    fill_in "Story", with: "4"
    fill_in "Helpful", with: "4"
    click_button "Comment This Jawn"

    expect(page).to have_content(min_submission.title)
    expect(page).to have_css("img[src*='test_submission_image.jpeg']")
    expect(page).to have_content "There was no comment for this rating"
    expect(page).to have_content "4"
    expect(page).to have_content "4"
    expect(page).to have_content "4"
    expect(page).to have_content "4"
  end

  scenario "unsuccessfully leaves a rating" do
    greg = FactoryGirl.create(:user)
    min_submission = FactoryGirl.create(:submission, user: greg)

    login_as(greg, :scope => :user)

    visit submission_path(min_submission)

    click_button "Comment This Jawn"

    expect(page).to have_content(min_submission.title)
    expect(page).to have_css("img[src*='test_submission_image.jpeg']")
    expect(page).to have_content("Rating troll can't be blank")
    expect(page).to have_content("Rating troll is not a number")
    expect(page).to have_content("Rating funny can't be blank")
    expect(page).to have_content("Rating funny is not a number")
    expect(page).to have_content("Rating story can't be blank")
    expect(page).to have_content("Rating story is not a number")
    expect(page).to have_content("Rating helpful can't be blank")
    expect(page).to have_content("Rating helpful is not a number")
    expect(page).to_not have_selector('li', count: 3)
  end

  scenario "user is not logged in" do
    greg = FactoryGirl.create(:user)
    min_submission = FactoryGirl.create(:submission, user: greg)

    visit submission_path(min_submission)

    fill_in "Troll", with: "1"
    fill_in "Funny", with: "1"
    fill_in "Story", with: "1"
    fill_in "Helpful", with: "1"
    click_button "Comment This Jawn"

    expect(page).to have_content("You need to sign in to do this")
  end
end

feature "user can leave a comment" do

  scenario "successfully makes comment" do
    greg = FactoryGirl.create(:user)
    min_submission = FactoryGirl.create(:submission, user: greg)

    login_as(greg, :scope => :user)

    visit submission_path(min_submission)

    fill_in "Comment", with: "This is so great!"
    fill_in "Troll", with: "4"
    fill_in "Funny", with: "4"
    fill_in "Story", with: "4"
    fill_in "Helpful", with: "4"
    click_button "Comment This Jawn"

    expect(page).to have_content(min_submission.title)
    expect(page).to have_css("img[src*='test_submission_image.jpeg']")
    expect(page).to have_content "This is so great!"
  end
end
