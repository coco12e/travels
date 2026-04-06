class AddConfirmedToTrips < ActiveRecord::Migration[8.1]
  def change
    add_column :trips, :confirmed, :boolean
  end
end
