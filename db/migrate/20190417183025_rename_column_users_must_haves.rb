class RenameColumnUsersMustHaves < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :must_haves
  end
end
