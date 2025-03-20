class AddLatitudeAndLongitudeToComics < ActiveRecord::Migration[7.2]
  def change
    add_column :comics, :latitude, :float
    add_column :comics, :longitude, :float
  end
end
