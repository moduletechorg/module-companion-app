class UserLandFeedbacksController < ApplicationController

  def toggleActive
    land = Land.find(params[:land])
    feedback_option = Feedback.find(params[:feedback_option])

    ulf = UserLandFeedback.where(["user_id = ? and land_id = ? and feedback_id = ?", current_user.id, land.id, feedback_option.id ]).first
    if ulf
      ulf.toggle(:active)
      ulf.save
    else
      ulf = UserLandFeedback.new
      ulf.user_id = current_user.id
      ulf.land_id = land.id
      ulf.feedback_id = feedback_option.id
      ulf.active = true
      ulf.save
    end
  end

end
