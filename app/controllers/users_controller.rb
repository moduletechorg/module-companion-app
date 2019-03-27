class UsersController < ApplicationController
  before_action :user_is_admin?, only: [:index, :make_admin, :remove_admin, :impersonate]

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to edit_user_registration_path(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin? || @user == current_user
      flash[:danger] = "You do not have permission to view that profile"
      redirect_to root_path
    end
  end

  def make_admin
    @user = User.find(params[:id])
    @user.update_attribute :admin, true
    flash[:success] = "#{@user.email} is now an admin"
    render 'show'
  end

  def remove_admin
    @user = User.find(params[:id])
    @user.update_attribute :admin, false
    flash[:warning] = "#{@user.email} is no longer an admin"
    render 'show'
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

  private

    def user_info_params
      params.permit(:housing_option, :age, :current_housing, :living_with, :num_kids, :current_type_housing, :current_size_housing, :state, :city, :neighborhood, :location_perks, :preferred_bedroom, :preferred_bathroom, :must_haves, :move_in_time, :budget, :mortgage, :pre_approved_mortgage, :down_payment_amount, :first_name, :last_name, :location_perks_other)
    end

end
