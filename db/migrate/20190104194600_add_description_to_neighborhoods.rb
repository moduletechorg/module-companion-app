class AddDescriptionToNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    add_column :neighborhoods, :description, :text
  end
end
