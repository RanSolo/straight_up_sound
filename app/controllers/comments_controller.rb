class CommentsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  	@comments = Comment.all
  end

  def new
  	@comment = Comment.new
  end

  def create
    @user = current_user
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Your comment has been created"
      redirect_to song_path(@comment.commentable_id)
    else
      flash[:alert] = "Your comment could not be created"
      redirect_to song_path(@comment.commentable_id)
    end
  end

  def show
    # @user = User.find(params[:id])
  	@comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :username, :recording_id, :song_id, :comment, :commentable_id, :commentable_type, :user_id)
  end
end
#<Comment id: nil, title: "", comment: "something about something", commentable_id: 31, commentable_type: nil, user_id: nil, role: "comments", created_at: nil, updated_at: nil>
# 2.1.1 :008 > comment
