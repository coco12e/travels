class TripsController < ApplicationController
  before_action :set_trip, only: %i[show select_flight unselect_flight confirm export]
  before_action :set_show_categories_nav, only: %i[show export]

  def index
    @trips = current_user.trips
  end

  def show
    @destination = @trip.destination
    @bookmarks_by_category = @trip.bookmarks.map(&:place).group_by(&:category)
    @sub_categories_by_category = build_sub_categories_by_category
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user

    if @trip.save
      redirect_to trip_categories_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def export
    @destination = @trip.destination
    @bookmarks_by_category = @trip.bookmarks.map(&:place).group_by(&:category)
    @sub_categories_by_category = build_sub_categories_by_category
    render layout: "export"
  end

  def confirm
    if params[:unconfirm]
      @trip.update(confirmed: false)
    else
      @trip.update(confirmed: true)
    end
    redirect_to trip_path(@trip)
  end

  def select_flight
    @trip.update(flight_id: params[:flight_id])
    redirect_to trip_flights_path(@trip)
  end

  def unselect_flight
    @trip.update(flight_id: nil)
    redirect_to trip_flights_path(@trip)
  end

  private

  def set_show_categories_nav
    @show_categories_nav = true
  end

  def set_trip
    @trip = current_user.trips.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:destination_id, :flight_id)
  end

  def build_sub_categories_by_category
    @destination.categories.to_h do |cat|
      [cat, cat.places.pluck(:sub_category).uniq.compact]
    end
  end
end
