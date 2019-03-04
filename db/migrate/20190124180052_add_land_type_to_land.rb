class AddLandTypeToLand < ActiveRecord::Migration[5.2]
  def change
    add_reference :lands, :land_type, foreign_key: true
  end
end
