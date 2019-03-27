class NearbyLocationsController < ApplicationController
  def new
    @location = NearbyLocation.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
    @loc = NearbyLocation.find(params[:id])
    @land = Land.find(@loc.land_id)
    @loc.destroy
    redirect_to edit_land_path(@land)
  end

  def index
  end
end
