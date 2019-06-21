class RemoveColumnTotalVisitsFromLands < ActiveRecord::Migration[5.2]
  def change
    remove_column :lands, :total_visits
  end
end
