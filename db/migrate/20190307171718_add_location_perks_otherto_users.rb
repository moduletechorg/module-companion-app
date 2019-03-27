class AddLocationPerksOthertoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :location_perks_other, :text
  end
end
