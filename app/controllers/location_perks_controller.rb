class LocationPerksController < ApplicationController
  before_action :set_location_perk, only: [:show, :edit, :update, :destroy]

  # GET /location_perks
  # GET /location_perks.json
  def index
    @location_perks = LocationPerk.all
  end

  # GET /location_perks/1
  # GET /location_perks/1.json
  def show
  end

  # GET /location_perks/new
  def new
    @location_perk = LocationPerk.new
  end

  # GET /location_perks/1/edit
  def edit
  end

  # POST /location_perks
  # POST /location_perks.json
  def create
    @location_perk = LocationPerk.new(location_perk_params)

    respond_to do |format|
      if @location_perk.save
        format.html { redirect_to @location_perk, notice: 'Location perk was successfully created.' }
        format.json { render :show, status: :created, location: @location_perk }
      else
        format.html { render :new }
        format.json { render json: @location_perk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_perks/1
  # PATCH/PUT /location_perks/1.json
  def update
    respond_to do |format|
      if @location_perk.update(location_perk_params)
        format.html { redirect_to @location_perk, notice: 'Location perk was successfully updated.' }
        format.json { render :show, status: :ok, location: @location_perk }
      else
        format.html { render :edit }
        format.json { render json: @location_perk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_perks/1
  # DELETE /location_perks/1.json
  def destroy
    @location_perk.destroy
    respond_to do |format|
      format.html { redirect_to location_perks_url, notice: 'Location perk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_perk
      @location_perk = LocationPerk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_perk_params
      params.require(:location_perk).permit(:name)
    end
end
