class LandsController < ApplicationController
  before_action :user_is_admin?, only: [:new, :edit, :destroy]

  def index
    if params[:neighborhood_id]
      @lands = Land.where(neighborhood: params[:neighborhood_id])
      @neighborhood_name = Neighborhood.find(params[:neighborhood_id]).name
    else
      @lands = Land.all
    end
    @neighborhoods = Neighborhood.all.order("name ASC")
  end

  def new
    @land = Land.new
  end

  def create
    @land = Land.create(land_params)

    if @land.save
      flash[:success] = "New lot created."
      render 'show'
    else
      render 'new'
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
      flash[:success] = "Lot has been updated."
      @neighborhood = Neighborhood.find(@land.neighborhood_id)
      render 'show'
    else
      render 'edit'
    end

  end

  def destroy
    @land = Land.find(params[:id])
    @land.destroy
    render 'index'
  end

  def delete_image
    @land = Land.find(params[:id])
    image_id = params[:attachment_id]
    @land.images.find(image_id).purge
    flash[:warning] = "Image has been deleted"
    render 'edit'
  end

  def land_params
    params.require(:land).permit(:address, :neighborhood_id, :size, :parcel_id, :pricing, :zoning_declaration, :mapframe, images: [])
  end
end
