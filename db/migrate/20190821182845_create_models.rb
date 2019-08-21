class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :models do |t|
      t.string :name
      t.integer :bedrooms
      t.float :bathrooms
      t.integer :sqft
    end
  end
end
