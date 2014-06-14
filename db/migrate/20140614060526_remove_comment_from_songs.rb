class RemoveCommentFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :comment
  end
end
