class SavedLotsController < ApplicationController

  def index
    @saved_lots = SavedLot.where({ user_id: current_user })
  end

end
