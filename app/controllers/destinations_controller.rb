class DestinationsController < ApplicationController
  before_action :authenticate_user!
  before_action :hide_egypte, only: [:index]

  def index
    @continent = Continent.find_by(name: params[:continent])
    @destinations = @continent.destinations
  end

  def show
    @show_categories_nav = true
    @destination = Destination.find(params[:id])
    @trip = current_user.trips.where(destination: @destination).order(:created_at).last
  end

  private

  def hide_egypte
    @hide_egypte_nav = true
  end
end
