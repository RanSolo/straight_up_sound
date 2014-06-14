class Users::SongsController < UsersController
  def show
    @song = Song.find(params[:id])
    @song_comments = Comment.where(post_id: params[:id], post_class: "Song")
    @recordings = @song.recordings
  end
end
