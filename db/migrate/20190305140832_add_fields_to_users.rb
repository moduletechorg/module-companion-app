class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :housing_option, :string
    add_column :users, :age, :int
    add_column :users, :current_housing, :string
    add_column :users, :current_type_housing, :string
    add_column :users, :current_size_housing, :int
    add_column :users, :living_with, :string
    add_column :users, :num_kids, :int
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :neighborhood, :string
    add_column :users, :location_perks, :text
    add_column :users, :preferred_bedroom, :int
    add_column :users, :preferred_bathroom, :float
    add_column :users, :must_haves, :text
    add_column :users, :move_in_time, :string
    add_column :users, :budget, :int
    add_column :users, :mortgage, :boolean
    add_column :users, :pre_approved_mortgage, :boolean
    add_column :users, :down_payment_amount, :int
  end
end
