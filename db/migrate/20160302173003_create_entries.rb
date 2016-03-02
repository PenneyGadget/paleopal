class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :notes
      t.text :ingredients
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.references :day, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
