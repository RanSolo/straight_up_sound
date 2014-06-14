class CreateUserRecordings < ActiveRecord::Migration
  def change
    create_table :user_recordings do |t|
      t.integer :user_id
      t.integer :recording_id
      t.timestamps
    end
  end
end
