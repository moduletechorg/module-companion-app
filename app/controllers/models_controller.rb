class ModelsController < ApplicationController
  before_action :user_is_admin?

  def index
    @models = Model.all
  end

  def new
    @model = Model.new
  end

  def create
    @model = Model.create(model_params)

    if @model.save
      flash[:success] = "New model created."
      redirect_to models_path
    else
      render 'new'
    end
  end

  def edit
    @model = Model.find(params[:id])
  end

  def update
    @model = Model.find(params[:id])

    if @model.update_attributes(model_params)
      flash[:success] = "Model has been updated"
      redirect_to models_path
    else
      flash[:danger] = "Error while updating model"
      render 'edit'
    end
  end

  def destroy
    @model = Model.find(params[:id])
    @model.destroy
    redirect_to models_path
  end

  private

    def model_params
      params.require(:model).permit(:name, :bedrooms, :bathrooms, :sqft)
    end
end
