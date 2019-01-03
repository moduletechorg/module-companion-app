class NeighborhoodsController < ApplicationController
  #validate :user_is_admin, :before => :create, :update, :delete

  def index
    @neighborhoods = Neighborhood.all.order("name ASC")
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = Neighborhood.new(neighborhood_params)

    if @neighborhood.save
      redirect_to :action => 'index'
    else
      redirect_to :action => 'new'
    end
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
  end

  def edit
    @neighborhood = Neighborhood.find(params[:id])
  end

  def update
    @neighborhood = Neighborhood.find(params[:id])

    if @neighborhood.update_attributes(neighborhood_params)
      redirect_to :action => 'show', :id => @neighborhood
    else
      redirect_to :action => 'edit', :id => @neighborhood
    end

  end

  def destroy
    @neighborhood = Neighborhood.find(params[:id])
    @neighborhood.destroy
    redirect_to neighborhoods_path
  end

  def neighborhood_params
    params.require(:neighborhood).permit(:name, :city, :state)
  end
end
