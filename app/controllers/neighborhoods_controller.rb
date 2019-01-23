class NeighborhoodsController < ApplicationController
  before_action :user_is_admin?, only: [:new, :edit, :destroy]

  def index
    @neighborhoods = Neighborhood.all.order("name ASC")
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = Neighborhood.create(neighborhood_params)

    if @neighborhood.save
      render 'index'
    else
      render 'new'
    end
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    @lands = Land.where(neighborhood: params[:id])
  end

  def edit
    @neighborhood = Neighborhood.find(params[:id])
  end

  def update
    @neighborhood = Neighborhood.find(params[:id])

    if @neighborhood.update_attributes(neighborhood_params)
      flash[:success] = "Neighborhood has been updated"
      render 'show'
    else
      flash[:danger] = "Error while updating neighborhood"
      render 'edit'
    end

  end

  def destroy
    @neighborhood = Neighborhood.find(params[:id])
    @neighborhood.destroy
    flash[:warning] = "Neighborhood has been deleted"
    render 'index'
  end

  def delete_image
    @neighborhood = Neighborhood.find(params[:id])
    image_id = params[:attachment_id]
    @neighborhood.images.find(image_id).purge
    flash[:warning] = 'Image has been deleted'
    render 'edit'
  end

  def neighborhood_params
    params.require(:neighborhood).permit(:name, :city, :state, :description, :mapframe, :image, images: [])
  end
end
