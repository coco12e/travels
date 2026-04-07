class ApplicationController < ActionController::Base
  before_action :set_navbar_data

  private

  def set_navbar_data
    @egypte = Destination.find_by(name: "L'Égypte")
    @navbar_trip = current_user.trips.find_by(destination: @egypte) if user_signed_in? && @egypte
  end
end
