class AddMapFrameToNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    add_column :neighborhoods, :mapframe, :text
  end
end
