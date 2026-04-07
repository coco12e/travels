class CategoriesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @categories = Category.where(destination: @trip.destination)
  end
end
