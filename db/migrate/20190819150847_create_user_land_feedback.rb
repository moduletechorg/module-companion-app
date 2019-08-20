class CreateUserLandFeedback < ActiveRecord::Migration[5.2]
  def change
    create_table :user_land_feedbacks do |t|
      t.references :user
      t.references :land
      t.references :feedback
    end
  end
end
