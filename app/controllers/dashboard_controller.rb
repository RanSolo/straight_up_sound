class DashboardController < ApplicationController

  def index
    @user = current_user
    @songs = current_user.songs
    @recordings = current_user.recordings
  end

end
