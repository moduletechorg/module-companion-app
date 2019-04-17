class RemoveAgeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :age, :int
    remove_column :users, :current_housing
    remove_column :users, :living_with
    remove_column :users, :num_kids
    remove_column :users, :current_type_housing
    remove_column :users, :current_size_housing
    remove_column :users, :neighborhood
    remove_column :users, :mortgage
    remove_column :users, :down_payment_amount
    remove_column :users, :location_perks_other
  end
end
