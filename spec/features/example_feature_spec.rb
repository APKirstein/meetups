require 'spec_helper'

feature "User views the index page" do
  scenario "user sees the correct title" do
    visit '/'

    expect(page).to have_content "Hello World"
  end
end

feature "user has option to sign in via github upon clicking sign in" do
  scenario "user clicks signin link" do
    visit '/'
    click_link "Sign in"
    expect(page.current_path).to have_content "/login/oauth/authorize"
  end
end

feature "user is signed out upon clicking the signout link" do
  scenario "user clicks signout link" do
    visit '/sign_out'
    expect(page).to have_content "You have been signed out."
  end
end
