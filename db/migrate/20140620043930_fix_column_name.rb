class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :recordings, :submitted_at, :created_at
  end
end
