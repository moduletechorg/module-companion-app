class FeedbacksController < ApplicationController
  before_action :authenticate_admin!

  def index
    @feedbacks = Feedback.all
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.create(feedback_params)

    if @feedback.save
      flash[:success] = "New feedback option created."
      redirect_to feedbacks_path
    else
      render 'new'
    end
  end

  def edit
    @feedback = Feedback.find(params[:id])
  end

  def update
    @feedback = Feedback.find(params[:id])

    if @feedback.update_attributes(feedback_params)
      flash[:success] = "Feedback option has been updated"
      redirect_to feedbacks_path
    else
      flash[:danger] = "Error while updating feedback"
      render 'edit'
    end
  end

  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to feedbacks_path
  end

  private

    def feedback_params
      params.require(:feedback).permit(:name, :icon_class)
    end
end
