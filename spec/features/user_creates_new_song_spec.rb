require 'spec_helper'

feature "New song" do
  let!(:johnny) {Fabricate(:user, username: "neely",
                           email: "neely@neely.com",
                           first_name: "Johnny",
                           last_name: "Neel")}
  scenario "user creates a new song" do
    login_as johnny
    fill_in "Title", with: "Blowing in the Wind"
    click_button "create song"
    page.should have_content "Your song has been created"
    # page.should have_content "neely"
    page.should have_content "Blowing in the Wind"
  end

end
