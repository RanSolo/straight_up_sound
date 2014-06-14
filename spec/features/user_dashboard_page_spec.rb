require 'spec_helper'

feature "User visits dashboard page" do
  let!(:johnny) {Fabricate(:user, email: "john@neely.com", first_name: "Johnny", last_name: "Neel", password: "password")}
  let!(:randy) {Fabricate(:user, email: "ransolo@me.com", first_name: "Randy", last_name: "Russell", password: "password")}
  # let!(:draft) {Fabricate(:draft_comment, content: "This is a draft", user: randy)}

  scenario "User visits own profile page" do
    login_as randy
    visit user_path(randy)
    page.should have_content "ransolo@me.com"
    page.should have_content "This is your profile"
    page.should have_content "Drafts"
    page.should have_content "This is a draft"
  end

  scenario "User visits someone elses profile page" do
    login_as randy
    visit user_path(johnny)
    page.should have_content "neely@neely.com"
    page.should_not have_content "ransolo@me.com"
    # page.should_not have_content "Drafts"
    # page.should_not have_content "This is a draft"
    page.should have_content "Follow this user"
  end

  scenario "user not logged in" do
    visit user_path(johnny)
    page.should have_content "neely@neely.com"
    page.should_not have_content "ransolo@me.com"
    # page.should_not have_content "Drafts"
    # page.should_not have_content "This is a draft"
    # page.should_not have_content "Dashboard"
    # page.should_not have_content "Follow this user"
  end
end
