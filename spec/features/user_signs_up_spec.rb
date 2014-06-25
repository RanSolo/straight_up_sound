require 'spec_helper'

feature "User signs up" do
  scenario "happy path" do
    visit '/'
    click_link "Sign up"
    fill_in "email", with: "joe@example.com"
    fill_in "username", with: "joie"
    fill_in "password", with: "mypassword"
    fill_in "retype password", with: "mypassword"
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
    fill_in "email", with: "joe@example.com"
    fill_in "password", with: "mypassword"
    fill_in "retype password", with: "notthesame"
    click_button "Sign up"
    page.should_not have_content "Dashboard"
    page.should have_content "Your account could not be created"

    page.should have_error("has already been taken", on: "email")
    page.should have_error("doesn't match Password", on: "retype password")
    page.should have_error("has already been taken", on: "username")
  end

  scenario "failed signup because invalid characters in username" do
    visit '/'
    click_link "Sign up"
    fill_in "email", with: "joe@example.com"
    fill_in "username", with: "joe@example"
    fill_in "password", with: "mypassword"
    fill_in "retype password", with: "mypassword"
    click_button "Sign up"
    page.should_not have_content "Dashboard"
    page.should have_content "Your account could not be created"
    page.should have_error("can only contain letters", on: "username")
  end

  scenario "user receives welcome email" do
    # PR 2: Welcome Emails
  end
end
