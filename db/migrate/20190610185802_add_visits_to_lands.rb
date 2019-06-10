class AddVisitsToLands < ActiveRecord::Migration[5.2]
  def change
    add_column :lands, :total_visits, :int, default: 0
  end
end
