class AddModelToLands < ActiveRecord::Migration[5.2]
  def change
    add_column :lands, :model, :string
  end
end
