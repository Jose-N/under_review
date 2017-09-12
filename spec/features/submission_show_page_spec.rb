require 'rails_helper'

feature "see show page for a submission" do
  before(:each) do
    @greg = FactoryGirl.create(:user)
    @min_submission = FactoryGirl.create(:submission, user: @greg)
  end

  scenario "user visit minimum submission" do

    visit submission_path(@min_submission)

    login_as(@greg, :scope => :user)

    expect(page).to have_content(@min_submission.title)
    expect(page).to have_content(@greg.username)
    expect(page).to have_css("img[src*='test_submission_image.jpeg']")
  end

  scenario "user visit full submission" do
    full_submission = FactoryGirl.create(:submission, :full, user: @greg)

    visit submission_path(full_submission)

    login_as(@greg, :scope => :user)

    expect(page).to have_content(full_submission.title)
    expect(page).to have_content(full_submission.description)
    expect(page).to have_content(@greg.username)
    expect(page).to have_link("Original Review", href: full_submission.url)
    expect(page).to have_css("img[src*='test_submission_image.jpeg']")
  end

end

feature "user can see comments on page" do
  before(:each) do
    @greg = FactoryGirl.create(:user)
    @min_submission = FactoryGirl.create(:submission, user: @greg)
  end

  scenario "user goes to show page for a submission for comments" do
    steven = FactoryGirl.create(:user)

    first_comment = FactoryGirl.create(:comment, submission: @min_submission, user: steven)

    login_as(steven, :scope => :user)
    visit submission_path(@min_submission)

    expect(page).to have_content(first_comment.body)
    expect(page).to have_content(steven.username)
  end
end


feature "user can see ratings on show page" do
  before(:each) do
    @greg = FactoryGirl.create(:user)
    @min_submission = FactoryGirl.create(:submission, user: @greg)
  end

  scenario "user goes to show page for a submission" do

    comment = FactoryGirl.create(:comment, user: @greg, submission_id: @min_submission.id)

    visit submission_path(@min_submission)
    expect(page).to have_content("Overall Troll: 1")
    expect(page).to have_content("Overall Funny: 1")
    expect(page).to have_content("Overall Story: 1")
    expect(page).to have_content("Overall Helpful: 1")
    expect(page).to have_content(comment.troll)
    expect(page).to have_content(comment.funny)
    expect(page).to have_content(comment.story)
    expect(page).to have_content(comment.helpful)
  end
end

feature "user sees edit submisison link" do
  before(:each) do
    @greg = FactoryGirl.create(:user)
    @min_submission = FactoryGirl.create(:submission, user: @greg)
  end

  scenario "user sees link if owner" do
    login_as(@greg, :scope => :user)

    visit submission_path(@min_submission)

    expect(page).to have_content(@min_submission.title)
    expect(page).to have_content(@greg.username)
    expect(page).to have_css("img[src*='test_submission_image.jpeg']")
    expect(page).to have_link("Edit this Jawn")
  end

  scenario "user doesn't see link if not owner" do
    not_greg = FactoryGirl.create(:user)

    visit submission_path(@min_submission)

    expect(page).to have_content(@min_submission.title)
    expect(page).to have_content(@greg.username)
    expect(page).to have_css("img[src*='test_submission_image.jpeg']")
    expect(page).to_not have_link("Edit this Jawn")
  end
end
