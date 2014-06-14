class Users::SongsController < UsersController

  def show
    @song = Song.find(params[:id])
  end
end
