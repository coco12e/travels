class BookmarksController < ApplicationController
  before_action :set_trip
  before_action :set_bookmark, only: [:destroy]

  def create
    place = Place.find(params[:place_id])
    @trip.bookmarks.find_or_create_by(place: place)
    redirect_to trip_category_places_path(@trip, place.category)
  end

  def destroy
    category = @bookmark.place.category
    @bookmark.destroy
    redirect_to trip_category_places_path(@trip, category)
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_bookmark
    @bookmark = @trip.bookmarks.find(params[:id])
  end
end
