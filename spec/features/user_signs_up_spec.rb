require 'spec_helper'

feature "User signs up" do
  scenario "happy path" do
    visit '/'
    click_link "Sign up"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "joie"
    fill_in "Password", with: "mypassword"
    fill_in "Password confirmation", with: "mypassword"
    click_button "Sign up"
    page.should have_content "Dashboard"
    page.should_not have_link("Sign up")

    click_link "Sign out"
    click_link "Sign in"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "mypassword"
    click_button "Sign in"
    page.should have_content "You have signed in successfully"
  end

  scenario "failed login" do
    Fabricate(:user, username: "joe")
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: 'joeieieie'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
    page.should have_content('Invalid email or password')
  end

  scenario "failed signup" do
    Fabricate(:user, email: "joe@example.com", username: "joe")
    visit '/'
    click_link "Sign up"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "mypassword"
    fill_in "Password confirmation", with: "notthesame"
    click_button "Sign up"
    page.should_not have_content "Dashboard"
    page.should have_content "Your account could not be created"

    page.should have_error("has already been taken", on: "Email")
    page.should have_error("doesn't match Password", on: "Password confirmation")
    page.should have_error("has already been taken", on: "Username")
  end

  scenario "failed signup because invalid characters in username" do
    visit '/'
    click_link "Sign up"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "joe@example"
    fill_in "Password", with: "mypassword"
    fill_in "Password confirmation", with: "mypassword"
    click_button "Sign up"
    page.should_not have_content "Dashboard"
    page.should have_content "Your account could not be created"
    page.should have_error("can only contain letters", on: "Username")
  end

  scenario "user receives welcome email" do
    # PR 2: Welcome Emails
  end
end
