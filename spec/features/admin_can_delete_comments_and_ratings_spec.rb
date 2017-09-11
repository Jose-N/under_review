require "rails_helper"

feature "admin can delete comment" do
  before(:each) do
    @greg = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:user, :admin)
    @submission = FactoryGirl.create(:submission, :full, user: @greg)
    @comment_one = FactoryGirl.create(:comment, user: @greg, submission: @submission)
    @rating = FactoryGirl.create(:rating, comment: @comment_one, user: @greg, submission: @submission)
  end

  scenario "successfully deletes comment" do
    old_comment = @comment_one.body

    login_as(@admin)

    visit submission_path(@submission)

    expect(page).to have_link "Delete comment"
    click_link "Delete comment"

    expect(page).to have_content "This Jawn is gone"
    expect(page).to_not have_content old_comment

  end

  scenario "user does not own page and does not see edit option" do
    not_greg = FactoryGirl.create(:user)
    login_as(not_greg, :scope => :user)

    visit submission_path(@submission)

    expect(page).to_not have_link "Delete comment"
  end

  scenario "user owns page and does not see edit option" do
    login_as(@greg, :scope => :user)

    visit submission_path(@submission)

    expect(page).to_not have_link "Delete Comment"
  end
end
