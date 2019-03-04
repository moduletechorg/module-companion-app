class LandTypesController < ApplicationController
  before_action :user_is_admin?

  def index
    @land_types = LandType.all
  end

  def new
    @land_type = LandType.new
  end

  def create
    @land_type = LandType.create(land_type_params)

    if @land_type.save
      flash[:success] = "New land type created."
      redirect_to land_types_path
    else
      render 'new'
    end
  end

  def edit
    @land_type = LandType.find(params[:id])
  end

  def destroy
    @land_type = LandType.find(params[:id])
    @land_type.destroy
    redirect_to land_types_path
  end

  private

  def land_type_params
    params.require(:land_type).permit(:name)
  end

end
