require 'rails_helper'

feature 'search', %(
  As a user
  I want to search reviews
  So that I can find awesome reviews
) do

  scenario 'user successfully searches by title' do
    user = FactoryGirl.create(:user)
    full_submission = FactoryGirl.create(:submission, :full, user: user)
    visit searches_path
    fill_in 'search', with: 'Air'
    click_button 'search'

    expect(page).to have_content 'stunting'
    expect(page).to_not have_content 'cat'
   end

  scenario 'user successfully searches by description' do
    user = FactoryGirl.create(:user)
    full_submission = FactoryGirl.create(:submission, :full, user: user)
    visit searches_path
    fill_in 'search', with: 'potato'
    click_button 'search'

    expect(page).to have_content full_submission.title
    expect(page).to_not have_content 'cat'
  end

  scenario 'user searches for nonexistent review' do
    user = FactoryGirl.create(:user)
    full_submission = FactoryGirl.create(:submission, :full, user: user)
    visit searches_path
    fill_in 'search', with: 'cat'
    click_button 'search'

    expect(page).to have_content "Sorry, we couldn't find this jawn."
    expect(page).to_not have_content 'cat'
  end

  scenario 'user searches for empty string' do
    user = FactoryGirl.create(:user)
    full_submission = FactoryGirl.create(:submission, :full, user: user)
    visit searches_path
    fill_in 'search', with: ''
    click_button 'search'

    expect(page).to have_content 'Sorry, please enter a valid search.'
    expect(page).to_not have_content 'cat'
  end
end
