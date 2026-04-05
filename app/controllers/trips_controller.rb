class TripsController < ApplicationController
  def index
    @trips = current_user.trips
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user

    if @trip.save
      case params[:next_step]
      when "categories"
        redirect_to trip_categories_path(@trip)
      when "transports"
        redirect_to trip_transports_path(@trip)
      when "show"
        redirect_to trip_path(@trip)
      else
        redirect_to trip_flights_path(@trip)
      end
    else
      @destination = Destination.find(params[:trip][:destination_id])
      render "destinations/show", status: :unprocessable_entity
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:destination_id)
  end
end
