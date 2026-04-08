class TransportsController < ApplicationController
  before_action :set_show_categories_nav
  before_action :set_trip

  def index
    @destination = @trip.destination
    @transports = @destination.transports
    @selected_ids = @trip.transport_ids
  end

  def create
    transport = Transport.find(params[:transport_id])
    @trip.transports << transport unless @trip.transports.include?(transport)
    redirect_to trip_transports_path(@trip)
  end

  def destroy
    transport = Transport.find(params[:transport_id])
    @trip.transports.delete(transport)
    redirect_to trip_transports_path(@trip)
  end

  private

  def set_show_categories_nav
    @show_categories_nav = true
  end

  def set_trip
    @trip = current_user.trips.find(params[:trip_id])
  end
end
