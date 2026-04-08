class PlacesController < ApplicationController
  before_action { @show_categories_nav = true }

  def index
    @trip = Trip.find(params[:trip_id])
    @category = Category.find(params[:category_id])
    @places = @category.places.where(destination_id: @trip.destination.id)
  end

  def show
    @place = Place.find(params[:id])
  end
end
