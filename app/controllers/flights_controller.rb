class FlightsController < ApplicationController
  before_action :authenticate_user!
  before_action { @show_categories_nav = true }

  def index
    @trip = current_user.trips.find_by(id: params[:trip_id])

    if @trip.nil?
      egypte = Destination.find_by(name: "L'Égypte")
      redirect_to destination_path(egypte) and return
    end

    @destination = @trip.destination

    @direct        = Flight.direct(@destination)
    @direct_mix    = Flight.direct_mix(@destination)
    @escale        = Flight.escale(@destination)
    @escale_aller  = Flight.escale_aller(@destination)
    @escale_retour = Flight.escale_retour(@destination)
  end
end
