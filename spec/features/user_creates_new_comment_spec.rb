require 'spec_helper'

feature "New comments" do

  scenario "user creates a new comment" do
    login_as Fabricate(:user, email: "ruby@example.com", username: "ruby")
    fill_in "title", with: "Text input with body for test!"
    click_button "create song"
    fill_in "Comment", with: "Text input comment body for test"
    page.should have_content "Text input with body for test!"
    page.should have_content "Text input comment body for test"
  end

  # scenario "user displays in comment" do
  #   login_as Fabricate(:user, email: "ruby@example.com", username: "ruby")
  #   click_link "create song"
  #   fill_in "Content", with: "Text input with body for test!"
  #   click_button "create song"
  #   click_link "view"
  #   fill_in "Comment", with: "Text input comment body for test"
  #   current_path.should == song_path(song.last)
  #   page.should have_content "Text input comment body for test"
  #   page.should have_content :user
  # end

  # scenario "user submits comment with no commnet" do
  #   login_as Fabricate(:user, email: "ruby@example.com", username: "ruby")
  #   click_link "create song"
  #   fill_in "Content", with: "Text input with body for test!"
  #   click_button "create song"
  #   click_link "view"
  #   fill_in "Comment", with: ""
  #   current_path.should == song_path(song.last)
  #   page.should have_content "Text input with body for test!"
  # end
end
