require 'spec_helper'

feature "New recordings to song" do

  scenario "user creates a new recording" do
    login_as Fabricate(:user, email: "ruby@example.com", username: "ruby")
    fill_in "Title", with: "Blowing in the Wind"
    click_button "create song"
    page.should have_content "Your song has been created"
    page.should have_content "Blowing in the Wind"
    fill_in "Name", with: "work tape"
    attach_file "File", "spec/data/east_nasty.mp3"
    click_button "create recording"
    page.should have_content "Your recording has been created"
    page.should have_content "work tape"
  end

  scenario "user fails to create a new recording" do
    login_as Fabricate(:user, email: "ruby@example.com", username: "ruby")
    click_button "create song"
    fill_in "Name", with: ""
    attach_file "File", "spec/data/east_nasty.mp3"
    click_button "create recording"
    page.should have_content "Your recording could not be created"
  end
end
