class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      user_path(resource)
    end

    def after_sign_up_path_for(resource)
      lands_path
    end

end