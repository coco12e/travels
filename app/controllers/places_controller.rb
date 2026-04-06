class PlacesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @category = Category.find(params[:category_id])
    @places = @category.places
  end

  def show
    @place = Place.find(params[:id])
  end
end
