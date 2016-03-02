class AddMealColumnToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :meal, :string
  end
end
