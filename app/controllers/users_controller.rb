class UsersController < ApplicationController
  before_action :user_is_admin?, only: [:index, :make_admin, :remove_admin]

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

end
