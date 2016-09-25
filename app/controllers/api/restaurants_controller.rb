class Api::RestaurantsController < ApplicationController
  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    
    respond_to do |format|
      format.json { render json: @restaurants }
      format.xml { render xml: @restaurants }
    end
  end

end
