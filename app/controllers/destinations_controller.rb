class DestinationsController < ApplicationController
  def index
    @continent = Continent.find_by(name: params[:continent])
    @destinations = @continent.destinations
  end

  def show
    @destination = Destination.find(params[:id])
    @trip = current_user.trips.where(destination: @destination).order(:created_at).first
  end
end
