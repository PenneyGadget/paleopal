class RemoveNicknameFromUserTable < ActiveRecord::Migration
  def change
    remove_column :users, :nickname
  end
end
