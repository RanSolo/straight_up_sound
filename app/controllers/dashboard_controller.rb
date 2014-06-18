class DashboardController < ApplicationController

  def index
    @user = current_user
    @songs = Song.all
    @recordings = Recording.all
  end
end
