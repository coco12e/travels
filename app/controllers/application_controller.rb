class ApplicationController < ActionController::Base
  before_action :set_navbar_data

  private

  def set_navbar_data
    @egypte = Destination.find_by(name: "L'Égypte")
    @navbar_trip = current_user.trips.where(destination: @egypte).last if user_signed_in? && @egypte
    @show_categories_nav = false
    @hide_egypte_nav = false
  end
end
