class NeighborhoodsController < ApplicationController

  def index
    @neighborhoods = Neighborhood.all
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

end
