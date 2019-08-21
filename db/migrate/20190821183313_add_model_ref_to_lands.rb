class AddModelRefToLands < ActiveRecord::Migration[5.2]
  def change
    remove_column :lands, :model
    add_reference :lands, :model
  end
end
