class DropTableLandTypes < ActiveRecord::Migration[5.2]
  def change
    remove_column :lands, :land_type_id
    drop_table :land_types
  end
end
