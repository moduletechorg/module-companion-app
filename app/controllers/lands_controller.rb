class LandsController < ApplicationController
  before_action :user_is_admin?, only: [:new, :edit, :destroy]

  def index
    @lands = Land.all
    @land_type = nil
    @neigbhorhood = nil
    @filtered = false

    neighborhood_param = params.dig("land", "neighborhood_id")
    land_type_param = params.dig("land", "land_type_id")

    if params.has_key?(:land)
      if !neighborhood_param.empty?
        @lands = @lands.neighborhood_filter(neighborhood_param)
        @neighborhood = Neighborhood.find(neighborhood_param)
        @filtered = true
      end
      if !land_type_param.empty?
        @lands = @lands.land_type_filter(land_type_param)
        @land_type = LandType.find(land_type_param)
        @filtered = true
      end
    end
  end

  def new
    @land = Land.new
  end

  def create
    @land = Land.create(land_params)

    if @land.save
      flash[:success] = "New lot created."
      redirect_to land_path(@land)
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
    params.require(:land).permit(:address, :neighborhood_id, :land_type_id, :size, :parcel_id, :pricing, :zoning_declaration, :mapframe, images: [])
  end
end
