require 'spec_helper'

feature 'user signs out', %Q{
  As a user
  I want to be able to sign out
} do

  scenario 'an existing user specifies a valid email and password' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button 'Sign In'

    click_link 'Sign Out'

    expect(page).to have_content("Signed out successfully.")
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Sign In")
  end
end
