class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # def delete_image
  #   @object = object.class.find(params[:id])
  #   image_id = params[:attachment_id]
  #   @object.images.find(image_id).purge
  #   redirect_back fallback_location: root
  # end

  private
    def user_is_admin?
      unless current_user.admin?
        errors.add("Admin priveleges are required to perform that action")
      end
    end
end
