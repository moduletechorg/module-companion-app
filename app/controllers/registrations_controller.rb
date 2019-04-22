class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      user_path(resource)
    end

    def after_sign_up_path_for(resource)
      flash[:success] = "Your account has been created! You will receive an email to confirm your account."
      lands_path
    end

end
