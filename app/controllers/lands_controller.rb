class LandsController < ApplicationController

  def index
    if params[:neighborhood_id]
      @lands = Land.where(:neighborhood => params[:neighborhood_id])
    else
      @lands = Land.all
    end
    @neighborhoods = Neighborhood.all.order("name ASC")
  end

  def new
    @land = Land.new
  end

  def create
    @land = Land.new(land_params)

    if @land.save
      redirect_to :action => 'index'
    else
      redirect_to :action => 'new'
    end
  end

  def show
    @land = Land.find(params[:id])
    @neighborhood = Neighborhood.find(@land.neighborhood_id)
  end

  def edit
    @land = Land.find(params[:id])
  end

  def update
    @land = Land.find(params[:id])

    if @land.update_attributes(land_params)
      redirect_to :action => 'show', :id => @land
    else
      redirect_to :action => 'edit', :id => @land
    end

  end

  def destroy
    @land = Land.find(params[:id])
    @land.destroy
    redirect_to lands_path
  end

  def land_params
    params.require(:land).permit(:address, :neighborhood_id, :size, :parcel_id, :pricing, :zoning_declaration)
  end
end
