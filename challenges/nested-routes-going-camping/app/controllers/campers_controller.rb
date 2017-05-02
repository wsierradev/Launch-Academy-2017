class CampersController < ApplicationController

  def index
    @title = "All Campers:"
    if params[:campsite_id]
      @campsite = Campsite.find(params[:campsite_id])
      @campers = @campsite.campers
    else
      @campers = Camper.all
    end
  end
end
