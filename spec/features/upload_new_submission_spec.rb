require "rails_helper"

feature "user can submit new review" do

  scenario "user successfully submits a minimum review" do
    greg = FactoryGirl.create(:user)

    login_as(greg, :scope => :user)

    visit new_submission_path

    fill_in "Title", with: "This is a test title"
    attach_file :submission_screenshot, "#{Rails.root}/spec/support/images/test_submission_image.jpeg"
    fill_in "Troll", with: "1"
    fill_in "Funny", with: "1"
    fill_in "Story", with: "1"
    fill_in "Helpful", with: "1"
    click_button "Rate This Jawn"

    expect(page).to have_content "This is a test title"
    expect(page).to have_css("img[src*='test_submission_image.jpeg']")
  end

  scenario "user successfully submits a full review" do
    greg = FactoryGirl.create(:user)

    login_as(greg, :scope => :user)

    visit new_submission_path
    fill_in "Title", with: "This is a test title"
    fill_in "Description", with: "This is a test description"
    fill_in "Url", with: "www.test.com"
    attach_file :submission_screenshot, "#{Rails.root}/spec/support/images/test_submission_image.jpeg"
    fill_in "Troll", with: "1"
    fill_in "Funny", with: "1"
    fill_in "Story", with: "1"
    fill_in "Helpful", with: "1"
    click_button "Rate This Jawn"

    expect(page).to have_content "This is a test title"
    expect(page).to have_content "This is a test description"
    expect(page).to have_link("Original Review", href: "www.test.com")
    expect(page).to have_css("img[src*='test_submission_image.jpeg']")
  end

  scenario "user unsuccessfully submits a review with no title or screenshot" do
    greg = FactoryGirl.create(:user)

    login_as(greg, :scope => :user)

    visit new_submission_path

    click_button "Rate This Jawn"

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Screenshot is required"
  end

  scenario "user unsuccessfully submits a review with no rating" do
    greg = FactoryGirl.create(:user)

    login_as(greg, :scope => :user)

    visit new_submission_path
    fill_in "Title", with: "This is a test title"
    attach_file :submission_screenshot, "#{Rails.root}/spec/support/images/test_submission_image.jpeg"

    click_button "Rate This Jawn"

    expect(page).to have_content("Troll can't be blank")
    expect(page).to have_content("Troll is not a number")
    expect(page).to have_content("Funny can't be blank")
    expect(page).to have_content("Funny is not a number")
    expect(page).to have_content("Story can't be blank")
    expect(page).to have_content("Story is not a number")
    expect(page).to have_content("Helpful can't be blank")
    expect(page).to have_content("Helpful is not a number")
  end

  scenario "user is not logged in" do
    visit new_submission_path

    expect(page).to have_content("You need to sign in to do this")
  end
end
