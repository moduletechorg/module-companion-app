class CreateModel < ActiveRecord::Migration[5.2]
  def change
    create_table :models do |t|
      t.string :name
      t.integer :bedrooms
      t.float :bathrooms
      t.integer :sqft

      t.timestamps
    end

    add_reference :lands, :model, foreign_key: true
  end
end
