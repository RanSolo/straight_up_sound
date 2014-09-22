require 'spec_helper'

feature "New song" do
  let!(:johnny) {Fabricate(:user, username: "neely",
                           email: "neely@neely.com",
                           first_name: "Johnny",
                           last_name: "Neel")}
  let!(:randy) {Fabricate(:user, username: "ransolo",
                        email: "ransolo@me.com",
                        first_name: "Randy",
                        last_name: "Russell")}
  scenario "user creates a new song" do
    login_as johnny
    fill_in "title", with: "Blowing in the Wind"
    fill_in "lyric", with: "this is a bad as lyric\n you never heard it\n"
    click_button "create song"
    page.should have_content "Your song has been created"
    page.should have_content "Blowing in the Wind"
    click_link "Sign out"
    login_as randy
    click_link "Dashboard"
    fill_in "title", with: "Hard Rain's Gonna Fall"
    fill_in "lyric", with: "this is a bad as lyric\n you never heard it\n"
    click_button "create song"
    page.should have_content "Your song has been created"
    page.should have_content "Hard Rain's Gonna Fall"
    page.should_not have_content "Blowing in the Wind"
  end

end
