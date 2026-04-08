class CreateTripTransports < ActiveRecord::Migration[8.1]
  def change
    create_table :trip_transports do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :transport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
