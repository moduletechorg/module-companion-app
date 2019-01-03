class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private
    def user_is_admin
      unless current_user.admin?
        errors.add("Admin priveleges are required to perform that action")
      end
    end
end
