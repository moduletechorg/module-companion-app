class CreateFeedback < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :name
    end
  end
end
