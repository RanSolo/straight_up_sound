class CreateLyrics < ActiveRecord::Migration
  def change
    create_table :lyrics do |t|
      t.string :title
      t.string :writers
      t.string :publisher
      t.string :text
      t.integer :song_id
      t.integer :commentable_id
      t.integer :user_id
      t.string :date_written
      t.timestamps
    end
  end
end
