class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.integer :song_id
      t.string :file
      t.integer :play_count
      t.timestamp :submitted_at
    end
  end
end
