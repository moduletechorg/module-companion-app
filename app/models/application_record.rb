class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private
    def user_is_admin?
      unless current_user.admin?
        errors.add("Admin priveleges are required to perform that action")
      end
    end
end
