class CreateSavedLots < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_lots do |t|
      t.belongs_to :user
      t.belongs_to :land
      t.timestamps
    end
  end
end
