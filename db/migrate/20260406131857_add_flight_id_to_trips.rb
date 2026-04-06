class AddFlightIdToTrips < ActiveRecord::Migration[8.1]
  def change
    add_column :trips, :flight_id, :integer
  end
end
