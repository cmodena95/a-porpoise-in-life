class CreatePorpoises < ActiveRecord::Migration[6.0]
  def change
    create_table :porpoises do |t|
      t.string :name
      t.string :species
      t.string :location
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
