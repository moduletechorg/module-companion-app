class AddDetailsToLands < ActiveRecord::Migration[5.2]
  def change
    add_column :lands, :why_we_like_it, :text
  end
end
