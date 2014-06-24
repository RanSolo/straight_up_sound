class RecordingsController < ApplicationController

  def new
    @recording = Recording.new
  end

  def index
    @recordings = Recording.all
  end

  def create
    @recording = current_user.recordings.build(recording_params)
    if @recording.save
      redirect_to song_path(@recording.song_id), notice: "Your recording has been created!"
    else
      flash[:alert] = "Your recording could not be created."
      redirect_to song_path(@recording.song_id)
    end
  end

  def show
    @recording = Recording.find(params[:id])
  end

  def play
    
  end

  private

  def recording_params
    params.require(:recording).permit(:name, :file, :comment, :song_id, :play_count, :created_at)
  end
end
