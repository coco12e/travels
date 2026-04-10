class BookmarksController < ApplicationController
  before_action :set_trip

  def create
    @place = Place.find(params[:place_id])
    @bookmark = @trip.bookmarks.find_or_create_by(place: @place)
    redirect_to trip_category_places_path(@trip, @place.category, anchor: "place-#{@place.id}")
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @place = @bookmark.place
    @bookmark.destroy
    redirect_to trip_category_places_path(@trip, @place.category, anchor: "place-#{@place.id}")
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
end
