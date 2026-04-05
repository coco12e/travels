class FlightsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @destination = @trip.destination
    flights = Flight.where(destination_id: @destination.id)

    @direct      = flights.select { |f| f.stopover.blank? && f.stopover_return.blank? && f.company == f.company_return }
    @direct_mix  = flights.select { |f| f.stopover.blank? && f.stopover_return.blank? && f.company != f.company_return }
    @escale      = flights.select { |f| f.stopover.present? && f.stopover_return.present? }
    @escale_aller  = flights.select { |f| f.stopover.present? && f.stopover_return.blank? }
    @escale_retour = flights.select { |f| f.stopover.blank? && f.stopover_return.present? }
  end
end
