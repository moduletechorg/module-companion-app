class AddIconToFeedback < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :icon_class, :string
  end
end
