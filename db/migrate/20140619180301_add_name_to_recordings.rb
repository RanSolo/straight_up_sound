class AddNameToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :name, :string
  end
end
