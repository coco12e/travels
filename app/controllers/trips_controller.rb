class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :select_flight, :confirm, :export]

  def index
    @trips = current_user.trips
  end

  def show
    @destination = @trip.destination
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user

    if @trip.save
      case params[:next_step]
      when "flights"
        redirect_to trip_flights_path(@trip)
      when "transports"
        redirect_to trip_transports_path(@trip)
      when "show"
        redirect_to trip_path(@trip)
      else
        redirect_to trip_categories_path(@trip)
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def export
    @destination = @trip.destination
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
    redirect_to trip_path(@trip)
  end

  private

  def set_trip
    @trip = current_user.trips.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:destination_id, :flight_id)
  end
end
