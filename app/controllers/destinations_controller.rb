class DestinationsController < ApplicationController
  def index
    @destinations = if params[:continent].present?
      continent = Continent.find_by(name: params[:continent])
      continent ? continent.destinations : Destination.all
    else
      Destination.all
    end
  end

  def show
    @destination = Destination.find(params[:id])
  end
end
