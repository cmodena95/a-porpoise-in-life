class AddCoordinatesToPorpoises < ActiveRecord::Migration[6.0]
  def change
    add_column :porpoises, :latitude, :float
    add_column :porpoises, :longitude, :float
  end
end
