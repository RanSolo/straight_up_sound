class ChangeLyricColumnToText < ActiveRecord::Migration
  def change
    change_column :songs, :lyric, :text

  end
end
