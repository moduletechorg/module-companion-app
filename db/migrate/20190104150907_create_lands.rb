class CreateLands < ActiveRecord::Migration[5.2]
  def change
    create_table :lands do |t|
      t.string :address
      t.references :neighborhood, foreign_key: true
      t.float :acreage
      t.string :size
      t.string :parcel_id
      t.float :pricing
      t.string :zoning_declaration

      t.timestamps
    end
  end
end
