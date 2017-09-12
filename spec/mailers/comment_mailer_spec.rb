require "rails_helper"

RSpec.describe CommentMailer, type: :mailer do
  scenario "it does the thing" do

    greg = FactoryGirl.create(:user)
    submission = FactoryGirl.create(:submission, user: greg)

    login_as(greg, :scope => :user)

    visit submission_path(submission)

    fill_in "Troll", with: "1"
    fill_in "Funny", with: "1"
    fill_in "Story", with: "1"
    fill_in "Helpful", with: "1"
    click_button "Comment This Jawn"

    expect(page).to have_content("Overall Troll: 1")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
