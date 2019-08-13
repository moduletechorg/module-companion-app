class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]

  protected

    def after_update_path_for(resource)
      user_path(resource)
    end

    def after_sign_up_path_for(resource)
      flash[:success] = "Your account has been created! You will receive an email to confirm your account."
      lands_path
    end

    def check_captcha
      unless verify_recaptcha
        self.resource = resource.class.new sign_up_params
        resource.validate
        set_minimum_password_length
        respond_with resource
      end
    end

end
