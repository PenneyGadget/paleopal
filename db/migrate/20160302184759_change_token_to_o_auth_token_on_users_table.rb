class ChangeTokenToOAuthTokenOnUsersTable < ActiveRecord::Migration
  def change
    rename_column :users, :token, :oauth_token
  end
end
