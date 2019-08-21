class RemoveColumnsLands < ActiveRecord::Migration[5.2]
  def change
    remove_column :lands, :bedrooms
    remove_column :lands, :bathrooms
    remove_column :lands, :sqft
  end
end
