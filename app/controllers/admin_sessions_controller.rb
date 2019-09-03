class AdminSessionsController < Devise::SessionsController

  protected

    def after_sign_in_path_for(resource)
      if user_signed_in?
        sign_out current_user
      end

      lands_path
    end

    def after_sign_out_path_for(resource)
      new_admin_session_path
    end

end
