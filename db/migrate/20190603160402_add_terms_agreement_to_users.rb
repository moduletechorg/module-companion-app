class AddTermsAgreementToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :terms_agreement, :boolean
    User.update_all(valid_age: true)
  end

  def down
    remove_column :users, :terms_agreement
  end
end
