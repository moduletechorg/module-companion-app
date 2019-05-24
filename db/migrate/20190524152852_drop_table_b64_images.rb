class DropTableB64Images < ActiveRecord::Migration[5.2]
  def change
    drop_table :b64_images
  end
end
