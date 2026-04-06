
class TripsController < ApplicationController
  def index
    @trips = current_user.trips
  end

  def select_flight
    @trip = Trip.find(params[:id])
    @trip.update(flight_id: params[:flight_id])
    redirect_to trip_path(@trip), notice: "Vol sélectionné !"
  end

  def show
    @trip = Trip.find(params[:id])
    @destination = @trip.destination
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to @trip
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:destination_id)
  end
end
