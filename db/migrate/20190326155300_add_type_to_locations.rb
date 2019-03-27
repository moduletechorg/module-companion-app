class AddTypeToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :nearby_locations, :within_10, :boolean, default: nil
    add_column :nearby_locations, :within_mile, :boolean, default: nil
  end
end
