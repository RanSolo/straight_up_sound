class AddCommentableIdToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :commentable_id, :integer
  end
end
