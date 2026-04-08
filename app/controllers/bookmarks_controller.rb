class BookmarksController < ApplicationController
  before_action :set_trip

  def create
    @place = Place.find(params[:place_id])
    @bookmark = @trip.bookmarks.find_or_create_by(place: @place)
    if params[:return_to] == "show"
      redirect_to trip_path(@trip)
    else
      redirect_to trip_category_places_path(@trip, @place.category, anchor: "place-#{@place.id}")
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @place = @bookmark.place
    @bookmark.destroy
    if params[:return_to] == "show"
      redirect_to trip_path(@trip)
    else
      redirect_to trip_category_places_path(@trip, @place.category, anchor: "place-#{@place.id}")
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
end
