class AddFeedbackToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :feedback, :boolean, default: false
  end
end
