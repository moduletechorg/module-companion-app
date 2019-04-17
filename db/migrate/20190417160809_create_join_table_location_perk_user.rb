class CreateJoinTableLocationPerkUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :location_perks, :users do |t|
      t.index [:location_perk_id, :user_id]
      t.index [:user_id, :location_perk_id]
    end
  end
end
