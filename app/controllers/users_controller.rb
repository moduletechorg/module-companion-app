class UsersController < ApplicationController

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to edit_user_registration_path(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def make_admin
    @user = User.find(params[:id])
    if current_user.admin?
      @user.update_attribute :admin, true
    end
    redirect_to users_path(@user)
  end

  def remove_admin
    @user = User.find(params[:id])
    if current_user.admin?
      @user.update_attribute :admin, false
    end
    redirect_to users_path(@user)
  end

end
