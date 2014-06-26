class AddWritersToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :writers, :string
  end
end
