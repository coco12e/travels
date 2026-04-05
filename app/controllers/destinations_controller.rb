class DestinationsController < ApplicationController
  def index
    if params[:continent].present?
      @continent = Continent.find_by(name: params[:continent])
      @destinations = @continent ? Destination.where(continent_id: @continent.id) : Destination.all
    else
      @destinations = Destination.all
    end
  end

  def show
    @destination = Destination.find(params[:id])
  end
end
