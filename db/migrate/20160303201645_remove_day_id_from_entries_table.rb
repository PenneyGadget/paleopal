class RemoveDayIdFromEntriesTable < ActiveRecord::Migration
  def change
    remove_foreign_key :entries, :days
  end
end
