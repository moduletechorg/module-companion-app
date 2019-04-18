class RemoveColumnsFromLand < ActiveRecord::Migration[5.2]
  def change
    remove_column :lands, :acreage
    remove_column :lands, :pricing
    remove_column :lands, :size
    remove_column :lands, :zoning_declaration
  end
end
