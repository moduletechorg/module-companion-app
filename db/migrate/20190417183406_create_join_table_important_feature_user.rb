class CreateJoinTableFeatureUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :features, :users do |t|
      t.index [:feature_id, :user_id]
      t.index [:user_id, :feature_id]
    end
  end
end
