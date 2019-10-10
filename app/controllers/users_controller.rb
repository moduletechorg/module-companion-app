class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :make_admin, :remove_admin, :impersonate]

  def index
    if current_admin
      @users = User.all.order('last_name, first_name')
    else
      redirect_to edit_user_registration_path(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
    unless current_admin || @user == current_user
      flash[:danger] = "You do not have permission to view that profile"
      redirect_to root_path
    end
  end

  def impersonate
    user = User.find(params[:id])
    impersonate_user(user)
    redirect_to root_path
  end

  def stop_impersonating
    stop_impersonating_user
    redirect_to root_path
  end

  def toggleSave
    land = Land.find(params[:land_id])
    saved_lot = SavedLot.where(["user_id = ? and land_id = ?", current_user.id, land.id ]).first
    if saved_lot
      saved_lot.destroy
    else
      saved_lot = SavedLot.new
      saved_lot.land = land
      saved_lot.user = current_user
      saved_lot.save
    end
  end

end
