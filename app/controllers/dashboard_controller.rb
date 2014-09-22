class DashboardController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @songs = Song.all
    @recordings = Recording.all
  end
end
