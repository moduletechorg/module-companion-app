class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  impersonates :user
  before_action :configure_permitted_parameters, if: :devise_controller?

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
        redirect_to new_user_session_path
      end
    end

  protected

    def configure_permitted_parameters

      devise_parameter_sanitizer.permit(:sign_up) { |u|
      u.require(:first_name)
      u.require(:last_name)
      u.require(:email)
      u.require(:password )
      u.require(:password_confirmation)
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :housing_option, :state, :city, :preferred_bedroom, :preferred_bathroom, :move_in_time, :budget, :pre_approved_mortgage, :first_name, :last_name, location_perk_ids: [], feature_ids: [] ) }

      devise_parameter_sanitizer.permit(:account_update) { |u| u.require(:first_name)
      u.require(:last_name)
      u.require(:email)
      u.require(:current_password)
      u.permit(:first_name, :last_name, :email, :password, :current_password, :password_confirmation, :housing_option, :state, :city, :location_perks, :preferred_bedroom, :preferred_bathroom, :move_in_time, :budget, :pre_approved_mortgage, :first_name, :last_name, location_perk_ids: [], feature_ids: [] ) }
    end

end
