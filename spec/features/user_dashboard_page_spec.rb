require 'spec_helper'

feature "User visits dashboard page" do
  let!(:johnny) {Fabricate(:user, username: "neely",
                           email: "neely@neely.com",
                           first_name: "Johnny",
                           last_name: "Neel")}
  let!(:randy) {Fabricate(:user, username: "ransolo",
                          email: "ransolo@me.com",
                          first_name: "Randy",
                          last_name: "Russell")}
  # let!(:draft) {Fabricate(:draft_comment, content: "This is a draft", user: randy)}

  scenario "User visits own profile page" do
    login_as randy
    visit user_path(randy)
    page.should have_content "ransolo@me.com"
  end

  scenario "User visits someone elses profile page" do
    login_as randy
    visit user_path(johnny)
    page.should have_content "neely@neely.com"
    page.should_not have_content "ransolo@me.com"
  end

  scenario "user not logged in" do
    visit user_path(johnny)
    page.should_not have_content "neely@neely.com"
    page.should_not have_content "ransolo@me.com"
    page.should_not have_content "Dashboard"
  end
end
