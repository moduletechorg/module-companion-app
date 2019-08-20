class AddActiveToUserLotFeedback < ActiveRecord::Migration[5.2]
  def change
    add_column :user_land_feedbacks, :active, :boolean, default: false, null: false
  end
end
