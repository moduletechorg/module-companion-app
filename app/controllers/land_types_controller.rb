class LandTypesController < ApplicationController
  before_action :user_is_admin?

  def index
    @land_types = LandType.all
  end

  def new
    @land_type = LandType.new
  end

  def edit
    @land_type = LandType.find(params[:id])
  end

  def destroy
    @land_type = LandType.find(params[:id])
    @land_type.destroy
    render 'index'
  end

  private

  def land_type_params
    params.require(:land_type).permit(:name)
  end

end
