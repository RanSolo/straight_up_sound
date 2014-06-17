class Users::SongsController < UsersController
  def index
    @songs = Song.find(all)
  end

  def show
    @song = Song.find(params[:id])
  end
end
