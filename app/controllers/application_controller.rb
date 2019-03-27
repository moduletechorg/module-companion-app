class ApplicationController < ActionController::Base
  impersonates :user

  private
    def user_is_admin?
      if current_user
        unless current_user.admin?
          flash[:danger] = "Admin priveleges are required to perform that action"
          redirect_back fallback_location: root_path
        end
      else
        flash[:danger] = "You must be logged in to perform that action"
        redirect_back fallback_location: root_path
      end
    end

    def user_logged_in?
      if !(user_signed_in?)
        flash[:warning] = "You must be logged in for access"
        redirect_to new_user_session_path
      end
    end
end
