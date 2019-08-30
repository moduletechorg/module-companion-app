class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show]

  def index
    if current_admin
      @admins = Admin.all.order('last_name, first_name')
    else
      redirect_to edit_admin_registration_path(current_admin)
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

end
