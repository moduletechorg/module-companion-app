class AddFieldsToLands < ActiveRecord::Migration[5.2]
  def change
    add_column :lands, :bedrooms, :integer
    add_column :lands, :bathrooms, :float
    add_column :lands, :sqft, :integer
    add_column :lands, :pricing, :string
    add_column :lands, :location_mapframe, :string
    rename_column :lands, :mapframe, :nearby_mapframe
  end
end
