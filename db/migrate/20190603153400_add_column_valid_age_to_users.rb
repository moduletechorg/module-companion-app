class AddColumnValidAgeToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :valid_age, :boolean
    User.update_all(valid_age: true)
  end

  def down
    remove_column :users, :valid_age
  end
end
