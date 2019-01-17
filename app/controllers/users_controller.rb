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
  end

  def make_admin
    @user = User.find(params[:id])
    if current_user.admin?
      @user.update_attribute :admin, true
    end
    #add flash message here
    render 'show'
  end

  def remove_admin
    @user = User.find(params[:id])
    if current_user.admin?
      @user.update_attribute :admin, false
    end
    #add flash message here
    render 'show'
  end

end
