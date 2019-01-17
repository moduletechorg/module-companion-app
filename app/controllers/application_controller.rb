class ApplicationController < ActionController::Base

  # def delete_image
  #   @object = object.class.find(params[:id])
  #   image_id = params[:attachment_id]
  #   @object.images.find(image_id).purge
  #   redirect_back fallback_location: root
  # end

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
end
