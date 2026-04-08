class DestinationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @hide_egypte_nav = true
    @continent = Continent.find_by(name: params[:continent])
    @destinations = @continent.destinations
  end

  def show
    @show_categories_nav = true
    @destination = Destination.find(params[:id])
    @trip = current_user.trips.where(destination: @destination).order(:created_at).last
  end
end
