class BookmarksController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @place = Place.find(params[:place_id])
    unless @trip.bookmarks.exists?(place: @place)
      @trip.bookmarks.create!(place: @place)
    end
    redirect_to trip_category_places_path(@trip, @place.category)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @trip = @bookmark.trip
    @place = @bookmark.place
    @bookmark.destroy
    redirect_to trip_category_places_path(@trip, @place.category)
  end
end
