class NeighborhoodsController < ApplicationController

  def index
    @neighborhoods = Neighborhood.all
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
  end

  def update
  end

  def delete
  end

  def neighborhood_params
    params.require(:neighborhood).permit(:name, :city, :state)
  end
end
