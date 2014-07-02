class AddAuthenticityTokenToComments < ActiveRecord::Migration
  def change
    add_column :comments, :authenticity_token, :string
  end
end
