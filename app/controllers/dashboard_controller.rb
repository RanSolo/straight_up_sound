class DashboardController < ApplicationController

  def index
    @user = current_user
    # @songs = Song.all    user = User.find(params[:id])
    @songs = current_user.songs
  end

end
