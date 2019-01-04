class AddMapFrameToLands < ActiveRecord::Migration[5.2]
  def change
    add_column :lands, :mapframe, :text
  end
end
