class AddProfileInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :description, :text
    add_column :users, :facebook_username, :string
    add_column :users, :twitter_username, :string
    rename_column :users, :username, :github_username
  end
end
