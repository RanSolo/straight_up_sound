class SongsController < UsersController

  def new
    @song = Song.new
  end

  def index
    @songs = Song.all
    @recordings = Recordings.all
  end

  def create
    @song = current_user.songs.build(song_params)
    if @song.save
      redirect_to song_path(@song.id), notice: "Your song has been created!"
    else
      flash[:alert] = @song.save ? "Your song could not be created." : "Your squmbl could not be saved."
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  private
  def song_params
    params.require(:song).permit(:title, :user_id, :recording, :comment)
  end
end
