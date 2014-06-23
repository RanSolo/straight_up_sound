class AddCommentableIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :commentable_id, :integer
  end
end
