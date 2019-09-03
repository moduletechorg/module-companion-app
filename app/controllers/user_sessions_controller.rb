class UserSessionsController < Devise::SessionsController

  protected

    def after_sign_in_path_for(resource)
      byebug

      if admin_signed_in?
        sign_out current_admin
      end

      lands_path
    end

    def after_sign_out_path_for(resource)
      new_user_session_path
    end

end
