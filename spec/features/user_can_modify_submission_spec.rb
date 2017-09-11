require "rails_helper"

feature "user can edit submission" do
  before(:each) do
    @greg = FactoryGirl.create(:user)
    @submission = FactoryGirl.create(:submission, :full, user: @greg)
  end

  scenario "successfully edits submission" do
    old_title = @submission.title
    old_description = @submission.comment[0].body

    login_as(@greg, :scope => :user)

    visit edit_submission_path(@submission)

    expect(page).to have_content "Edit Submission"
    expect(find_field('Title').value).to eq @submission.title

    fill_in "Title", with: "New Title"
    # fill_in "Description", with: "New Description"
    click_button "Edit This Jawn"

    expect(page).to have_content "New Title"
    # expect(page).to have_content "New Description"
    expect(page).to_not have_content old_title
    # expect(page).to_not have_content old_description
  end

  scenario "unsuccessfully edits submission" do
    login_as(@greg, :scope => :user)
    visit edit_submission_path(@submission)

    expect(page).to have_content "Edit Submission"
    expect(find_field('Title').value).to eq @submission.title

    fill_in "Title", with: ""
    click_button "Edit This Jawn"

    expect(page).to have_content "Title can't be blank"
  end

  scenario "user is not logged in" do
    visit edit_submission_path(@submission)

    expect(page).to have_content "You need to sign in to do this"
  end

  scenario "user is admin" do
    admin = FactoryGirl.create(:user, :admin)
    login_as(admin)

    visit edit_submission_path(@submission)

    expect(page).to have_content "Edit Submission"
    expect(find_field('Title').value).to eq @submission.title
  end

  scenario "user does not own submission" do
    not_greg = FactoryGirl.create(:user)

    login_as(not_greg, :scope => :user)

    visit edit_submission_path(@submission)

    expect(page).to have_content "You are not authorized to do that"
  end

  scenario "admin successfully sees edit link" do
    admin = FactoryGirl.create(:user, :admin)
    login_as(admin)

    visit submission_path(@submission)

    expect(page).to have_link "Edit this Jawn"
  end

  scenario "user does not own page and does not see edit option" do
    not_greg = FactoryGirl.create(:user)
    login_as(not_greg, :scope => :user)

    visit submission_path(@submission)

    expect(page).to_not have_link "Edit this Jawn"
  end
end

feature "user can delete submission" do
  before(:each) do
    @greg = FactoryGirl.create(:user)
    @submission = FactoryGirl.create(:submission, :full, user: @greg)
  end

  scenario "successfully deletes submission" do
    submission_count = Submission.count
    login_as(@greg, :scope => :user)

    visit submission_path(@submission)

    expect(page).to have_link "Delete this Jawn"

    click_link "Delete this Jawn"

    expect(page).to have_content "This Jawn is gone"
    expect(Submission.count).to eq(submission_count-1)
  end

  scenario "admin successfully sees delete link" do
    admin = FactoryGirl.create(:user, :admin)
    login_as(admin)

    visit submission_path(@submission)

    expect(page).to have_link "Delete this Jawn"
  end

  scenario "user does not own page and does not see delete option" do
    not_greg = FactoryGirl.create(:user)
    login_as(not_greg, :scope => :user)

    visit submission_path(@submission)

    expect(page).to_not have_link "Delete this Jawn"
  end
end
