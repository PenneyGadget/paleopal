class AddForeignKeytoEntriesTable < ActiveRecord::Migration
  def change
    add_foreign_key :entries, :users
  end
end
