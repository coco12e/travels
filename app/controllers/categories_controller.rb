class CategoriesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @categories = Category.all
  end
end
