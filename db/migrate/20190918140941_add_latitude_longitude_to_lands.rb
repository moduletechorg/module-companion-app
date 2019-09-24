class AddLatitudeLongitudeToLands < ActiveRecord::Migration[5.2]
  def change
    add_column :lands, :latitude, :float
    add_column :lands, :longitude, :float
  end
end
