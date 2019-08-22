require 'rmagick'
include Magick

class LandsController < ApplicationController
  before_action :user_is_admin?, only: [:new, :edit, :destroy]
  before_action :user_logged_in?, only: [:show, :index]
  #before_action :check_image_dimensions, only: [:update]
  after_action :track_lot, only: [:show]

  def index
    @lands = Land.all.order("RANDOM()")
    @feedback_options = Feedback.all
    @land_type = nil
    @neigbhorhood = nil
    @filtered = false
    @contact_form = ContactForm.new(name: "#{current_user.first_name} #{current_user.last_name}", email: current_user.email)

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
    @nearby_locations_10 = NearbyLocation.where("land_id" => @land.id, "within_10" => true)
    @nearby_locations_mi = NearbyLocation.where("land_id" => @land.id, "within_mile" => true)
    @contact_form = ContactForm.new
  end

  def edit
    @locations = nil
    @land = Land.find(params[:id])
    @locations = NearbyLocation.where("land_id" => @land.id)
  end

  def update
    @land = Land.find(params[:id])
    locations_10 = params[:land][:nearby_locations_10]
    locations_mi = params[:land][:nearby_locations_mi]
    parse_locations(locations_10, true)
    parse_locations(locations_mi, nil)

    if @land.update_attributes(land_params)
      flash[:success] = "Lot has been updated."
      @neighborhood = Neighborhood.find(@land.neighborhood_id)
      redirect_to land_path(@land)
    else
      render 'edit'
    end

  end

  def destroy
    @land = Land.find(params[:id])
    @land.destroy
    redirect_to lands_path
  end

  def delete_image
    @land = Land.find(params[:id])
    image_id = params[:attachment_id]
    @land.images.find(image_id).purge
    flash[:warning] = "Image has been deleted"
    render 'edit'
  end

  def other_lots
    @contact_form = ContactForm.new
  end

  private

    def land_params
      params.require(:land).permit(:land, :address, :neighborhood_id, :land_type_id, :model, :bedrooms, :bathrooms, :sqft, :pricing, :location_mapframe, :nearby_mapframe, :why_we_like_it, :nearby_locations, images: [])
    end


    def parse_locations(locations, is_10)
      within_10 = nil
      within_mi = nil

      if is_10
        within_10 = true
      else
        within_mi = true
      end

      locs = locations.split(/\n/)
      locs.each do |loc|
        puts loc
        new_loc = NearbyLocation.new
        new_loc.name = loc
        new_loc.land_id = @land.id
        new_loc.within_10 = within_10
        new_loc.within_mile = within_mi
        new_loc.save
      end
    end

    def check_image_dimensions
      if params[:land][:images]
        image_path = params[:land][:images].first.path
        #image = Magick::Image.from_blob(image_blob)
        image = Magick::ImageList.new
        bin = File.open(image_path, 'r'){ |file| file.read }
        img = image.from_blob(bin)
        img_width = img.columns * 1.0
        img_height = img.rows * 1.0


        err_message = ""
        err = false

        if img_width < 300
          err = true
        end
        if img_height < 200
          err = true
        end
        if ((img_height / img_width) != (2/3))
          err = true
        end

        if err
          flash[:danger] = "Image must be a minimum of 200 pixels tall and 300 pixels wide with a 2:3 height to width aspect ratio."
          redirect_to edit_land_path(params[:id])
        end
      end

    end

    def track_lot
      ahoy.track "Viewed Lot", request.path_parameters
    end
end
