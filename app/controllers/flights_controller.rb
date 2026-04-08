class FlightsController < ApplicationController
  before_action :set_show_categories_nav

  def index
    @trip = current_user.trips.find(params[:trip_id])
    @destination = @trip.destination

    @direct = Flight.direct(@destination)
    @direct_mix = Flight.direct_mix(@destination)
    @escale = Flight.escale(@destination)
    @escale_aller = Flight.escale_aller(@destination)
    @escale_retour = Flight.escale_retour(@destination)
  end

  private

  def set_show_categories_nav
    @show_categories_nav = true
  end
end
