class CreateLocationPerks < ActiveRecord::Migration[5.2]
  def change
    create_table :location_perks do |t|
      t.string :name

      t.timestamps
    end
  end
end
