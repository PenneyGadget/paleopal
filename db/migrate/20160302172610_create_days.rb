class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.datetime :date
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
