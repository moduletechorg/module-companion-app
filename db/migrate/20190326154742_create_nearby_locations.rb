class CreateNearbyLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :nearby_locations do |t|
      t.string :name, null: false
      t.integer :land_id, null: false
      t.timestamps
    end
  end
end
