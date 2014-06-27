class SongsController < UsersController
  skip_before_filter :require_profile!, only: :edit

  def new
    @song = Song.new
  end

  def index
    @songs = Song.all
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

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find_by_id(params[:id])
    if @song.update(lyric: params[:song][:lyric], title: params[:song][:title], writers: params[:song][:writers])
      redirect_to song_path(@song.id), notice: "Your song has been updated!"
    else
      flash[:alert] = @song.published ? "Your song could not be created." : "Your song could not be saved."
      render :new
    end
  end

  private
  def song_params
    params.require(:song).permit(:title, :user_id, :lyric, :writers, :recording, :comment, :edit)
  end
end
